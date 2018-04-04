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

#define SOLTEST_TEST_TOOL_IMPL(frwd_type, P, assertion_descr, FILE, LINE, TL, CT, ARGS)     \
do {                                                                            \
    BOOST_TEST_PASSPOINT();                                                     \
    ::boost::test_tools::tt_detail::                                            \
    BOOST_PP_IF( frwd_type, report_assertion, check_frwd ) (                    \
        BOOST_JOIN( BOOST_TEST_TOOL_PASS_PRED, frwd_type )( P, ARGS ),          \
        BOOST_TEST_LAZY_MSG( assertion_descr ),                                 \
        FILE,                                                                   \
        static_cast<std::size_t>(LINE),                                         \
        ::boost::test_tools::tt_detail::TL,                                     \
        ::boost::test_tools::tt_detail::CT                                      \
        BOOST_JOIN( BOOST_TEST_TOOL_PASS_ARGS, frwd_type )( ARGS ) );           \
} while( ::boost::test_tools::tt_detail::dummy_cond() )                         \

#define SOLTEST_ERROR_MESSAGE(FILE, LINE, M)         SOLTEST_TEST_TOOL_IMPL( 2, (false), M, FILE, LINE, CHECK, CHECK_MSG, _ )
#define SOLTEST_CHECK_MESSAGE(FILE, LINE, P, M)         SOLTEST_TEST_TOOL_IMPL( 2, (P), M, FILE, LINE, CHECK, CHECK_MSG, _ )

namespace soltest
{

class TestSuiteGenerator
{
public:
	TestSuiteGenerator(soltest::Soltest& _soltest, boost::unit_test::master_test_suite_t& _masterTestSuite);

	void load(bool _printWarnings);

	bool generateTestcases();

	void runTestcases();

	void processTestcaseResults(std::string const& _soltestFile, std::string const& _testcase);

	bool error()
	{
		return m_error;
	}

private:
	bool checkForWarningsAndErrors(bool _printWarnings);

	bool m_error;

	soltest::Soltest& m_soltest;
	boost::unit_test::master_test_suite_t& m_masterTestSuite;
};

} // namespace soltest

#endif //SOLTEST_TESTSUITEGENERATOR_H
