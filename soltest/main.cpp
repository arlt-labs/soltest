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
 * Stub for generating main boost.test module.
 * based on solidity/test/boostTest.cpp written by Marko Simovic <markobarko@gmail.com>
 */

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"

#if defined(_MSC_VER)
#pragma warning(push)
#pragma warning(disable:4535) // calling _set_se_translator requires /EHa
#endif

#include <boost/test/included/unit_test.hpp>
#include <boost/test/utils/runtime/cla/parser.hpp>

#if defined(_MSC_VER)
#pragma warning(pop)
#endif

#pragma GCC diagnostic pop

using namespace boost::unit_test;

#include <libsoltesting/Soltest.h>
#include <soltest/BuildInfo.h>
#include <soltest/TestSuiteGenerator.h>

#include <iostream>

static soltest::Soltest *g_soltest;
static soltest::TestSuiteGenerator *g_testSuiteGenerator;

test_suite *soltest_init_unit_test_suite(int argc, char **argv)
{
	static soltest::Soltest soltest;
	g_soltest = &soltest;

	if (soltest.parseCommandLineArguments(argc, argv))
	{
		master_test_suite_t &master = framework::master_test_suite();
		master.p_name.value = "soltest";

		static soltest::TestSuiteGenerator testSuiteGenerator(soltest, master);
		g_testSuiteGenerator = &testSuiteGenerator;

		testSuiteGenerator.addTestsToTestSuite();
	}

	return nullptr;
}

struct test_collector : test_tree_visitor
{
private:
	virtual bool visit(test_unit const &tu)
	{
		(void) tu;
		return true;
	}

	// Data members
	std::set<std::string> m_labels;
};

int soltest_unit_test_main(init_unit_test_func init_func, int argc, char *argv[])
{
	int result_code = 0;

	BOOST_TEST_I_TRY
	{
		framework::init(init_func, argc, argv);

		if (runtime_config::get<bool>(runtime_config::btrt_wait_for_debugger))
		{
			results_reporter::get_stream() << "Press any key to continue..." << std::endl;

			// getchar is defined as a macro in uClibc. Use parenthesis to fix
			// gcc bug 58952 for gcc <= 4.8.2.
			(std::getchar)();
			results_reporter::get_stream() << "Continuing..." << std::endl;
		}

		framework::finalize_setup_phase();

		output_format list_cont = runtime_config::get<output_format>(runtime_config::btrt_list_content);
		if (list_cont != boost::unit_test::OF_INVALID)
		{
			if (list_cont == boost::unit_test::OF_DOT)
			{
				ut_detail::dot_content_reporter reporter(results_reporter::get_stream());

				traverse_test_tree(framework::master_test_suite().p_id, reporter, true);
			}
			else
			{
				ut_detail::hrf_content_reporter reporter(results_reporter::get_stream());

				traverse_test_tree(framework::master_test_suite().p_id, reporter, true);
			}

			return boost::exit_success;
		}

		if (runtime_config::get<bool>(runtime_config::btrt_list_labels))
		{
			ut_detail::labels_collector collector;

			traverse_test_tree(framework::master_test_suite().p_id, collector, true);

			results_reporter::get_stream() << "Available labels:\n  ";
			std::copy(collector.labels().begin(), collector.labels().end(),
					  std::ostream_iterator<std::string>(results_reporter::get_stream(), "\n  "));
			results_reporter::get_stream() << "\n";

			return boost::exit_success;
		}

		// test_collector collector;
		// traverse_test_tree(framework::master_test_suite().p_id, collector, true);

		framework::run();
		g_testSuiteGenerator->join();
		framework::run();

		results_reporter::make_report();

		result_code = !runtime_config::get<bool>(runtime_config::btrt_result_code)
					  ? boost::exit_success
					  : results_collector.results(framework::master_test_suite().p_id).result_code();
	}
	BOOST_TEST_I_CATCH(framework::nothing_to_test, ex)
	{
		result_code = ex.m_result_code;
	}
	BOOST_TEST_I_CATCH(framework::internal_error, ex)
	{
		results_reporter::get_stream() << "Boost.Test framework internal error: " << ex.what() << std::endl;

		result_code = boost::exit_exception_failure;
	}
	BOOST_TEST_I_CATCH(framework::setup_error, ex)
	{
		results_reporter::get_stream() << "Test setup error: " << ex.what() << std::endl;

		result_code = boost::exit_exception_failure;
	}
	BOOST_TEST_I_CATCHALL()
	{
		results_reporter::get_stream() << "Boost.Test framework internal error: unknown reason" << std::endl;

		result_code = boost::exit_exception_failure;
	}

	framework::shutdown();

	return result_code;
}

int main(int argc, char *argv[])
{
	std::cout << "soltest v" << ETH_PROJECT_VERSION << std::endl;
	std::cout << "By Alexander Arlt <alexander.arlt@arlt-labs.com>, 2018." << std::endl << std::endl;

	boost::unit_test::init_unit_test_func init_func = &soltest_init_unit_test_suite;

	return soltest_unit_test_main(init_func, argc, argv);
}
