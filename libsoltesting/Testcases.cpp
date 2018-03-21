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
/** @file Testcases.cpp
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#include "Testcases.h"
#include "Soltest.h"

#include <boost/algorithm/string.hpp>

#include <map>
#include <string>

namespace soltest
{

Testcases::Testcases(const soltest::Soltest *_soltest,
					 std::string _filename,
					 std::map<std::string, std::string> _testcases) : m_soltest(_soltest)
{
	std::map<std::string, std::string> solidityContents = m_soltest->solidityContents();
	std::map<std::string, std::string> solidityTestContents = m_soltest->solidityTestContents();

	m_compiler = std::make_shared<dev::solidity::CompilerStack>(
		[&](std::string const &import) -> dev::solidity::ReadCallback::Result
		{
			dev::solidity::ReadCallback::Result result;
			result.success = true;

			auto solidityContentsImport = solidityContents.find(import);
			auto solidityTestContentsImport = solidityTestContents.find(import);

			if (solidityContentsImport != solidityContents.end())
				result.responseOrErrorMessage = solidityContentsImport->second;
			else if (solidityTestContents.find(import) != solidityTestContents.end())
				result.responseOrErrorMessage = solidityTestContentsImport->second;
			else
				result.success = false;

			return result;
		}
	);

	if (boost::ends_with(_filename, ".test.sol"))
	{
		m_compiler->addSource(_filename, solidityTestContents[_filename]);
	}
	else
	{
		std::string solidityFile(m_soltest->solidityFile(_filename));
		if (solidityFile.empty())
			solidityFile = _filename;

		m_compiler->addSource(solidityFile, solidityContents[solidityFile]);

		std::string testContractFileName(solidityFile);
		std::string testContractName(boost::filesystem::path(solidityFile).filename().string());
		boost::replace_all(testContractName, ".sol", "");
		boost::replace_all(testContractFileName, ".sol", ".test.sol");

		std::stringstream testContractContent;
		testContractContent << "pragma solidity ^0.4.0;" << std::endl << std::endl;
		testContractContent << "import '" << solidityFile << "';" << std::endl;
		testContractContent << "import 'Soltest.sol';" << std::endl << std::endl;
		testContractContent << "contract " << testContractName << "Test is Soltest {" << std::endl;
		for (auto &testcase : _testcases)
		{
			std::vector<std::string> soltestLines;
			boost::split(soltestLines, testcase.second, boost::is_any_of("\n"));
			testContractContent << "    function test_" << normalize(testcase.first) << "() {" << std::endl;
			for (auto &soltestLine : soltestLines)
			{
				boost::trim(soltestLine);
				if (!soltestLine.empty())
					testContractContent << "        " << soltestLine << std::endl;
			}
			testContractContent << "    }" << std::endl;
		}
		testContractContent << "}" << std::endl;

		// std::cout << testContractContent.str() << std::endl;

		m_compiler->addSource(testContractFileName, testContractContent.str());
	}

	bool errors = true;
	static Poco::Mutex parse_and_analyze_mutex;
	{
		// some how z3 is using a global shared state - not good for our multi-threaded execution...
		// so we sequentially call parseAndAnalyze();
		// todo: file issue on ethereum/solidity

		Poco::Mutex::ScopedLock lock(parse_and_analyze_mutex);
		errors = m_compiler->parseAndAnalyze();
	}

	if (!errors)
	{
		for (auto &e : m_compiler->errors())
		{
			(void) e;
//				std::cout << e->lineInfo() << " @ " << e->what() << std::endl;
		}
	}
	else
		for (auto &c : m_compiler->contractNames())
		{
			(void) c;
//				std::cout << c << std::endl;
		}
}

void Testcases::executeTestcase(std::string const &_testcase)
{
	(void) _testcase;
	/*
	if (!m_errors)
	{
		std::string testcaseFunctionName("test_" + normalize(_testcase));
		(void) testcaseFunctionName;
	}
	 */
}

std::string Testcases::normalize(std::string const &name)
{
	std::string result(name);
	boost::replace_all(result, " ", "_");
	return result;
}

} // namespace soltest