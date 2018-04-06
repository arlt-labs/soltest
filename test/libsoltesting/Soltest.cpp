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
/** @file Soltest.cpp
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 * Soltest tests.
 */

#include <string>

#include <boost/test/unit_test.hpp>

#include <libsoltesting/Soltest.h>

BOOST_AUTO_TEST_CASE(soltest_embedded_smoke_test_1)
{
	soltest::Soltest soltest(1);
	soltest.addSolidityFile(
		"Contract.sol", R"(
pragma solidity ^0.4.0;

contract Contract {
    /// @ext:soltest
    /// {assert-false}
    ///     assert(false);
    function add(uint16 a) public returns (uint16 result)  {
        return a;
    }
}
)");
	BOOST_REQUIRE(soltest.initialize());
	BOOST_REQUIRE(soltest.loadContracts());
	BOOST_REQUIRE(soltest.loadTestcases());
	BOOST_REQUIRE(soltest.generateTestcases());
	BOOST_REQUIRE(soltest.contracts().size() == 1);
	BOOST_REQUIRE(soltest.soltests("Contract.sol").size() == 1);
}

BOOST_AUTO_TEST_CASE(soltest_embedded_smoke_test_2)
{
	std::map<std::string, std::string> sources{{"Contract.sol", R"(
pragma solidity ^0.4.0;

contract Contract {
    /// @ext:soltest
    /// {assert-false}
    ///     assert(false);
    /// {assert-true}
    ///     assert(true);
    function add(uint16 a) public returns (uint16 result)  {
        return a;
    }
}
)"}};
	soltest::Soltest soltest(sources, 1);
	BOOST_REQUIRE(soltest.contracts().size() == 1);
	BOOST_REQUIRE(soltest.soltests("Contract.sol").size() == 2);
}
