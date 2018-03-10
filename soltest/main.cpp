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
#if defined(_MSC_VER)
#pragma warning(pop)
#endif

#pragma GCC diagnostic pop

using namespace boost::unit_test;

#include <libsoltesting/Soltest.h>
#include <soltest/BuildInfo.h>
#include <soltest/TestSuiteGenerator.h>

#include <iostream>

test_suite *init_unit_test_suite(int argc, char *argv[])
{
	static soltest::Soltest soltest;

	std::cout << "soltest v" << ETH_PROJECT_VERSION << std::endl;
	std::cout << "By Alexander Arlt <alexander.arlt@arlt-labs.com>, 2018." << std::endl << std::endl;

	if (soltest.parseCommandLineArguments(argc, argv))
	{
		master_test_suite_t &master = framework::master_test_suite();
		master.p_name.value = "soltest";

		static soltest::TestSuiteGenerator testSuiteGenerator(soltest, master);
		testSuiteGenerator.addTestsToTestSuite();
	}

	return nullptr;
}
