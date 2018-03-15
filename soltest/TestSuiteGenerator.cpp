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
	along with solidity.  If not, see <http://www.gnu.org/licenses/>.
*/
/** @file TestSuiteGenerator.cpp
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#include "TestSuiteGenerator.h"

#include <libsolidity/interface/SourceReferenceFormatter.h>

#include <boost/test/unit_test_suite.hpp>
#include <boost/test/test_tools.hpp>
#include <boost/algorithm/string.hpp>

namespace soltest
{

TestSuiteGenerator::TestSuiteGenerator(soltest::Soltest &_soltest,
									   boost::unit_test::master_test_suite_t &_masterTestSuite)
	: m_soltest(_soltest), m_masterTestSuite(_masterTestSuite)
{
}

bool TestSuiteGenerator::addTestsToTestSuite()
{
	bool loadContractsResult(m_soltest.loadContracts());
	bool loadTestcasesResult(m_soltest.loadTestcases());

	if (m_soltest.soltestErrors().empty())
	{
		auto checkForWarningsAndErrors =
			std::bind(&TestSuiteGenerator::checkForWarningsAndErrors,
					  this,
					  loadContractsResult,
					  loadTestcasesResult,
					  false);
		m_masterTestSuite.add(
			boost::unit_test::make_test_case(boost::function<void()>(checkForWarningsAndErrors),
											 "load contracts & testcases",
											 __FILE__,
											 __LINE__)
		);

		static std::vector<std::shared_ptr<std::string>> strings;
		for (auto const &soltestFile: m_soltest.soltests())
			for (auto const &testcase: soltestFile.second)
			{
				auto
					runTestcases =
					std::bind(&TestSuiteGenerator::startTestcase, this, soltestFile.first, testcase.first);
				size_t line(m_soltest.soltestLine(soltestFile.first, testcase.first));

				// tests are executed asynchronously, we need a valid reference to the dynamically created string,
				// where the c-string pointer need to be valid for a while.
				std::shared_ptr<std::string> filename_ptr(new std::string(soltestFile.first));
				strings.emplace_back(filename_ptr);

				std::stringstream testcase_name;
				testcase_name << testcase.first;
				std::shared_ptr<std::string> testcase_name_ptr(new std::string(testcase_name.str()));
				strings.emplace_back(testcase_name_ptr);

				m_masterTestSuite.add(
					boost::unit_test::make_test_case(boost::function<void()>(runTestcases),
													 testcase_name_ptr->c_str(),
													 filename_ptr->c_str(),
													 line
					)
				);
			}
	}
	else
		checkForWarningsAndErrors(false, false, true);

	return false;
}

void TestSuiteGenerator::checkForWarningsAndErrors(bool loadContractsResult,
												   bool loadTestcasesResult,
												   bool printToCerr)
{
	std::set<std::string> soltestErrorSet;
	std::set<std::string> warningSet;
	std::set<std::string> errorSet;

	std::stringstream stream;
	for (auto &errors : m_soltest.compilerErrors())
		if (errors.first == dev::solidity::Error::Type::Warning)
			for (auto &em : errors.second)
			{
				auto const &err = dynamic_cast<dev::solidity::Error const &>(*em);
				std::string
					formattedMessage = dev::solidity::SourceReferenceFormatter::formatExceptionInformation(
					*em, err.typeName(), m_soltest.scannerFromSourceName()
				);
				boost::replace_all(formattedMessage, "\n", "\n    ");
				warningSet.insert(formattedMessage);
			}
	stream.str("");
	stream << "\n    ";
	for (auto &warning : warningSet)
		stream << warning;

	if (!warningSet.empty() && printToCerr)
		std::cerr << stream.str() << std::endl;

	if (!printToCerr && !warningSet.empty())
		BOOST_TEST_MESSAGE(stream.str().c_str());

	for (auto &errors : m_soltest.compilerErrors())
		if (errors.first != dev::solidity::Error::Type::Warning)
			for (auto &em : errors.second)
			{
				auto const &err = dynamic_cast<dev::solidity::Error const &>(*em);
				std::string
					formattedMessage = dev::solidity::SourceReferenceFormatter::formatExceptionInformation(
					*em, err.typeName(), m_soltest.scannerFromSourceName()
				);
				boost::replace_all(formattedMessage, "\n", "\n    ");
				errorSet.insert(formattedMessage);
			}
	stream.str("");
	stream << "\n    ";
	for (auto &error: errorSet)
		stream << error;

	if (!errorSet.empty() && printToCerr)
		std::cerr << stream.str() << std::endl;

	if (!printToCerr && !errorSet.empty())
		BOOST_REQUIRE_MESSAGE(loadContractsResult, stream.str().c_str());

	for (auto &errors : m_soltest.soltestErrors())
		for (auto &e : errors.second)
		{
			std::stringstream formattedMessageStream;
			formattedMessageStream << e->file << ":" << e->line << ": " << e->what << std::endl;
			std::string formattedMessage(formattedMessageStream.str());
			boost::replace_all(formattedMessage, "\n", "\n    ");
			soltestErrorSet.insert(formattedMessage);
		}
	stream.str("");
	stream << "\n    ";
	for (auto &error : soltestErrorSet)
		stream << error;

	if (!soltestErrorSet.empty() && printToCerr)
		std::cerr << stream.str() << std::endl;

	if (!printToCerr && !soltestErrorSet.empty())
		BOOST_REQUIRE_MESSAGE(loadTestcasesResult, stream.str().c_str());
}

void TestSuiteGenerator::startTestcase(std::string const &soltestFile, std::string const &testcase)
{
	(void) soltestFile;
	(void) testcase;
	BOOST_REQUIRE(true);
	if (m_threads.find(soltestFile + ":" + testcase) == m_threads.end())
	{
		// first run: spawn test execution threads
		std::shared_ptr<std::thread> thread(
			new std::thread(
				[=]()
				{
					/*
					std::map<std::string, std::map<std::string, std::string>>
						soltests = m_soltest.soltests();
					std::cout << soltestFile << " - " << testcase << std::endl;
					std::cout << soltests[soltestFile][testcase] << std::endl;
					 */
					sleep(10);
				}
			)
		);
		m_threads[soltestFile + ":" + testcase] = thread;
	}
	else
	{
		// second run: collect results & create errors, if there where some
		BOOST_REQUIRE(true);
	}
}

void TestSuiteGenerator::join()
{
	for (auto &thread : m_threads)
	{
		thread.second->join();
	}
}

} // namespace soltest