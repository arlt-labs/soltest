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

#include <libsolidity/interface/CompilerStack.h>
#include <libsolidity/interface/SourceReferenceFormatter.h>
#include <libevmasm/SourceLocation.h>

#include <boost/algorithm/string.hpp>
#include <boost/test/test_tools.hpp>

#include <map>
#include <string>
#include <libsoltesting/interpreter/AstChecker.h>

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

	std::string testContractFileName;
	std::string testContractName;
	if (boost::ends_with(_filename, ".test.sol"))
	{
		testContractFileName = _filename;
		if (boost::filesystem::path(testContractFileName).is_relative())
			testContractFileName = boost::filesystem::absolute(boost::filesystem::path(testContractFileName)).string();
		testContractName = boost::filesystem::path(_filename).filename().string();
		m_compiler->addSource(testContractFileName, solidityTestContents[_filename]);
	}
	else
	{
		std::string solidityFile(m_soltest->solidityFile(_filename));
		if (solidityFile.empty())
			solidityFile = _filename;
		if (boost::filesystem::path(solidityFile).is_relative())
			solidityFile = boost::filesystem::absolute(boost::filesystem::path(solidityFile)).string();

		m_compiler->addSource(solidityFile, solidityContents[solidityFile]);

		testContractFileName = solidityFile;
		testContractName = boost::filesystem::path(solidityFile).filename().string();
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

//		std::cout << std::endl << _filename << std::endl << testContractContent.str() << std::endl;

		m_compiler->addSource(testContractFileName, testContractContent.str());
	}

	bool errors;
	static Poco::Mutex parse_and_analyze_mutex;
	{
		// somehow z3 is using a global shared state - not good for our multi-threaded execution...
		// so we sequentially call parseAndAnalyze();

		Poco::Mutex::ScopedLock lock(parse_and_analyze_mutex);
		errors = !m_compiler->parseAndAnalyze();
	}

	m_scannerFromSourceName =
		[&](std::string const &_sourceName) -> dev::solidity::Scanner const &
		{
			return m_compiler->scanner(_sourceName);
		};

	if (!errors)
	{
		dev::solidity::SourceUnit const &ast = m_compiler->ast(testContractFileName);
		soltest::interpeter::AstChecker checker(ast);
		if (!checker.isValid())
			for (auto &error : checker.errors())
				m_errors.push_back(createError(testContractFileName, *error, _filename));
	}
	else
	{
		for (auto &e : m_compiler->errors())
		{
			auto const &err = dynamic_cast<dev::solidity::Error const &>(*e);
			Error::Ptr warningOrError = createError(_filename, err);
			if (err.type() == dev::solidity::Error::Type::Warning)
				m_warnings.push_back(warningOrError);
			else
				m_errors.push_back(warningOrError);
		}
	}
}

void Testcases::executeTestcase(std::string const &_testcase)
{
	if (m_errors.empty())
	{
		std::string testcaseFunctionName("test_" + normalize(_testcase));
		(void) testcaseFunctionName;
	}
}

std::string Testcases::normalize(std::string const &name)
{
	std::string result(name);
	boost::replace_all(result, " ", "_");
	return result;
}

Testcases::Error::Ptr Testcases::createError(std::string const &_filename,
											 dev::solidity::Error const &_error,
											 std::string const &_realFilename /* = "" */)
{
	std::string formattedMessage = dev::solidity::SourceReferenceFormatter::formatExceptionInformation(
		_error, _error.typeName(), m_scannerFromSourceName
	);
	dev::SourceLocation const *location = boost::get_error_info<dev::solidity::errinfo_sourceLocation>(_error);
	auto secondarylocation = boost::get_error_info<dev::solidity::errinfo_secondarySourceLocation>(_error);

	int startLine(-1);
	int startColumn(-1);
	int errorLine(-1);
	std::stringstream originalLocation;
	if (location->sourceName != nullptr)
	{
		auto const &scanner = m_compiler->scanner(*location->sourceName);
		std::tie(startLine, startColumn) = scanner.translatePositionToLineColumn(location->start);
		originalLocation << *location->sourceName << ":" << (startLine + 1) << ":" << (startColumn + 1) << ": ";
	}

	std::string::size_type soltestLinePosition = formattedMessage.find("//soltest_line:");
	if (soltestLinePosition != std::string::npos)
	{
		std::string::size_type nextNewline = formattedMessage.find('\n', soltestLinePosition);
		std::string line
			(formattedMessage.substr(soltestLinePosition + 15, nextNewline - (soltestLinePosition + 15)));
		try
		{
			errorLine = boost::lexical_cast<int>(line);
		}
		catch (...)
		{
			errorLine = -1;
		}
		std::stringstream soltestLocation;
		soltestLocation << _filename << ":";
		soltestLocation << errorLine << ":" << (startColumn - 3) << ": ";
		if (nextNewline != std::string::npos)
		{
			formattedMessage =
				formattedMessage.erase(soltestLinePosition, nextNewline - soltestLinePosition);
			boost::replace_first(formattedMessage, originalLocation.str(), soltestLocation.str());
			if (!_realFilename.empty())
				boost::replace_first(formattedMessage, *location->sourceName, _realFilename);
		}
	}

	if (secondarylocation != nullptr && !secondarylocation->infos.empty())
	{
		if (location->sourceName != nullptr)
		{
			auto const &scanner = m_compiler->scanner(*location->sourceName);
			std::tie(startLine, startColumn) =
				scanner.translatePositionToLineColumn(secondarylocation->infos[0].second.start);
			originalLocation.str("");
			originalLocation << *location->sourceName << ":" << (startLine + 1) << ":" << (startColumn + 1) << ": ";
		}

		soltestLinePosition = formattedMessage.find("//soltest_line:");
		std::string::size_type nextNewline = formattedMessage.find('\n', soltestLinePosition);
		std::string line
			(formattedMessage.substr(soltestLinePosition + 15, nextNewline - (soltestLinePosition + 15)));
		try
		{
			errorLine = boost::lexical_cast<int>(line);
		}
		catch (...)
		{
			errorLine = -1;
		}
		std::stringstream soltestLocation;
		soltestLocation << _filename << ":";
		soltestLocation << errorLine << ":" << (startColumn - 3) << ": ";
		if (nextNewline != std::string::npos)
		{
			formattedMessage =
				formattedMessage.erase(soltestLinePosition, nextNewline - soltestLinePosition);
			boost::replace_first(formattedMessage, originalLocation.str(), soltestLocation.str());
			if (!_realFilename.empty())
				boost::replace_first(formattedMessage, *location->sourceName, _realFilename);
		}
	}

	boost::trim(formattedMessage);

	Error::Ptr result(std::make_shared<Error>());
	result->file = _filename;
	result->what = formattedMessage;
	result->line = errorLine;
	result->testcase = m_soltest->testcaseName(result->file, result->line);
	result->column = startColumn;

	return result;
}

} // namespace soltest