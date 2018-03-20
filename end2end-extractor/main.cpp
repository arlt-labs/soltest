/*
	This file is part of soltest.

	soltest is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	soltest is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with soltest.  If not, see <http://www.gnu.org/licenses/>.
*/
/** @file main.cpp
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 * Very simple end-to-end extractor for the solidity tests defined in
 * solidity/src/solidity-git/test/libsolidity/SolidityEndToEndTest.cpp.
 */

#include <iostream>
#include <sstream>
#include <fstream>
#include <string>
#include <set>
#include <map>
#include <boost/filesystem.hpp>
#include <boost/algorithm/string.hpp>

int main(int argc, char *argv[])
{
	if (argc == 3)
	{
		std::string source(argv[1]);
		std::string outputDirectory(argv[2]);

		std::ifstream stream(source);
		std::string line;
		std::stringstream contract;
		std::stringstream test;
		std::string testName;
		std::size_t testCount = 0;
		bool insideContractCode = false;
		bool insideTestCode = false;
		std::set<std::string> ignore{"conditional_expression_string_literal", "assignment_to_const_array_vars", "constant_struct"};
		std::map<std::string, std::pair<std::string, std::string>> tests;
		while (std::getline(stream, line))
		{
			if (line.find("BOOST_AUTO_TEST_CASE(") != std::string::npos)
			{
				if (ignore.find(testName) == ignore.end())
					++testCount;
				insideTestCode = false;
				insideContractCode = false;
				contract.str("");
				test.str("");
				testName = boost::replace_all_copy(boost::replace_all_copy(line, "BOOST_AUTO_TEST_CASE(", ""), ")", "");
				boost::replace_all(testName, "{", "");
				boost::trim(testName);
			}
			else if (!insideContractCode && line.find("sourceCode") != std::string::npos && line.find("R\"("))
				insideContractCode = true;
			else if (insideContractCode && line.find(")\";") != std::string::npos)
			{
				if (ignore.find(testName) == ignore.end() && testName.find("//") == std::string::npos)
				{
					if (line.find('}') != std::string::npos)
						contract << "}" << std::endl;
					tests[testName].first = contract.str();
				}
				insideTestCode = true;
			}
			else if (insideContractCode)
				contract << boost::replace_first_copy(line, "\t\t", "") << std::endl;

			if (insideTestCode && line.find(")\";") == std::string::npos && line != "}")
				test << "\t//" << boost::replace_first_copy(line, "\t", " ") << std::endl;
			if (line == "}")
			{
				if (ignore.find(testName) == ignore.end())
					tests[testName].second = test.str();
				insideTestCode = false;
			}
		}
		std::cout << "extracted " << testCount << " tests." << std::endl;
		boost::filesystem::create_directories(outputDirectory + boost::filesystem::path::separator + "embedded");
		boost::filesystem::create_directories(outputDirectory + boost::filesystem::path::separator + "solidity");
		boost::filesystem::create_directories(outputDirectory + boost::filesystem::path::separator + "soltest");
		for (auto &l : tests)
		{
			std::string testName(l.first);

			std::ofstream soltestSolFile
				(outputDirectory + boost::filesystem::path::separator + "soltest" + boost::filesystem::path::separator
					 + testName + ".sol");
			std::ofstream soltestSoltestFile
				(outputDirectory + boost::filesystem::path::separator + "soltest" + boost::filesystem::path::separator
					 + testName + ".soltest");
			soltestSolFile << l.second.first << std::endl;
			soltestSoltestFile << "{" + testName + "}" << std::endl;
			soltestSoltestFile << l.second.second << std::endl;

			std::ofstream embeddedSolFile
				(outputDirectory + boost::filesystem::path::separator + "embedded" + boost::filesystem::path::separator
					 + testName + ".sol");

			std::stringstream embeddedSoltest;
			std::stringstream embeddedSolidity;
			embeddedSoltest << "/// @ext:soltest" << std::endl;
			embeddedSoltest << "/// {" + testName + "}" << std::endl;
			std::vector<std::string> soltestLines;
			boost::split(soltestLines, l.second.second, boost::is_any_of("\n"));
			for (auto &soltestLine : soltestLines)
			{
				boost::replace_first(soltestLine, "\t", "");
				if (!soltestLine.empty())
				{
					embeddedSoltest << "///     " << soltestLine << std::endl;
					embeddedSolidity << "        " << soltestLine << std::endl;
				}
			}

			std::string embeddedSol(l.second.first);
			boost::replace_first(embeddedSol, "contract ", embeddedSoltest.str() + "contract ");
			embeddedSolFile << embeddedSol << std::endl;

			std::cout << l.first << std::endl;
			std::cout << l.second.first << " @ " << l.second.second << std::endl;

			std::ofstream soliditySolFile
				(outputDirectory + boost::filesystem::path::separator + "solidity" + boost::filesystem::path::separator
					 + testName + ".sol");
			soliditySolFile << l.second.first << std::endl;

			std::stringstream solidityTestcaseContract;
			solidityTestcaseContract << "import '" << testName << ".sol';" << std::endl;
			solidityTestcaseContract
				<< "import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically."
				<< std::endl;
			solidityTestcaseContract << std::endl;
			solidityTestcaseContract << "contract " << testName << "_Test is Soltest { " << std::endl;
			solidityTestcaseContract << "    function test_" << testName << "() { " << std::endl;
			solidityTestcaseContract << embeddedSolidity.str();
			solidityTestcaseContract << "    } " << std::endl;
			solidityTestcaseContract << "} " << std::endl;
			std::ofstream solidityTestcaseFile
				(outputDirectory + boost::filesystem::path::separator + "solidity" + boost::filesystem::path::separator
					 + testName + ".test.sol");
			solidityTestcaseFile << solidityTestcaseContract.str() << std::endl;
		}
	}
	return 0;
}
