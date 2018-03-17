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

		boost::filesystem::create_directories(outputDirectory);

		std::ifstream stream(source);
		std::string line;
		std::stringstream contract;
		std::stringstream test;
		std::string testName;
		std::size_t testCount = 0;
		bool insideContractCode = false;
		bool insideTestCode = false;
		std::set<std::string> ignore{"conditional_expression_string_literal"};
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
			}
			else if (!insideContractCode && line.find("sourceCode") != std::string::npos && line.find("R\"("))
			{
				insideContractCode = true;
			}
			else if (insideContractCode && line.find(")\";") != std::string::npos)
			{
				if (ignore.find(testName) == ignore.end())
				{
					std::ofstream
						solFile(outputDirectory + boost::filesystem::path::preferred_separator + testName + ".sol");
					solFile << contract.str() << std::endl;
					std::cout << testName << " @ " << testCount << "..." << std::endl;
					if (line.find("}") != std::string::npos)
						solFile << "}" << std::endl;
				}
				insideTestCode = true;
			}
			else if (insideContractCode)
			{
				contract << boost::replace_first_copy(line, "\t\t", "") << std::endl;
			}
			if (insideTestCode && line.find(")\";") == std::string::npos && line != "}")
			{
				test << "\t//" << boost::replace_first_copy(line, "\t", " ") << std::endl;
			}
			if (line == "}")
			{
				if (ignore.find(testName) == ignore.end())
				{
					std::ofstream
						soltestFile
						(outputDirectory + boost::filesystem::path::preferred_separator + testName + ".soltest");
					soltestFile << "{" << testName << "}" << std::endl;
					soltestFile << test.str() << std::endl;
				}
				insideTestCode = false;
			}
		}
		std::cout << "extracted " << testCount << " tests." << std::endl;
	}
	return 0;
}
