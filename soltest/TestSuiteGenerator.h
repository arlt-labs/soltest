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
/** @file TestSuiteGenerator.h
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#ifndef SOLTEST_TESTSUITEGENERATOR_H
#define SOLTEST_TESTSUITEGENERATOR_H

#include <libsoltesting/Soltest.h>
#include <boost/test/unit_test_suite.hpp>
#include <thread>
#include <memory>

namespace soltest
{

class TestSuiteGenerator
{
public:
	TestSuiteGenerator(soltest::Soltest &_soltest, boost::unit_test::master_test_suite_t &_masterTestSuite);

	void load(bool _printWarnings);

	void processTestcase(std::string const &soltestFile, std::string const &testcase);

	void runTestcases(unsigned int threads);

	bool error()
	{
		return m_error;
	}

private:
	bool checkForWarningsAndErrors(bool _printWarnings);

	bool m_error;

	soltest::Soltest &m_soltest;
	boost::unit_test::master_test_suite_t &m_masterTestSuite;
};

} // namespace soltest

#endif //SOLTEST_TESTSUITEGENERATOR_H
