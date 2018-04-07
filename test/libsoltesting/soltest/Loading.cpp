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
/** @file Loading.cpp
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 * Soltest tests.
 */

#include <string>

#include <boost/test/unit_test.hpp>

#include <libsoltesting/Soltest.h>

BOOST_AUTO_TEST_CASE(soltesting_single_embedded_loading)
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
	soltest::Soltest soltest;
	soltest.addSolidityFiles(sources);
	BOOST_REQUIRE(soltest.load());
	BOOST_REQUIRE(soltest.contracts().size() == 1);
	BOOST_REQUIRE(soltest.soltests("Contract.sol").size() == 2);
}

BOOST_AUTO_TEST_CASE(soltesting_multiple_embedded_loading)
{
	std::map<std::string, std::string> sources{
		{"Contract.sol", R"(
pragma solidity ^0.4.0;

import "OtherContract.sol";

contract Contract {
	OtherContract oc;
    /// @ext:soltest
    /// {assert-false}
    ///     assert(false);
    /// {assert-true}
    ///     assert(true);
    function add(uint16 a) public returns (uint16 result)  {
        return a;
    }
}
)"},
		{"OtherContract.sol", R"(
pragma solidity ^0.4.0;

contract OtherContract {
    /// @ext:soltest
    /// {assert-false}
    ///     assert(false);
    /// {assert-true}
    ///     assert(true);
    /// {assert-true-true}
    ///     assert(true);
    ///     assert(true);
    function add(uint16 a) public returns (uint16 result)  {
        return a;
    }
}
)"}};

	soltest::Soltest soltest;
	soltest.addSolidityFiles(sources);
	BOOST_REQUIRE(soltest.load());
	BOOST_REQUIRE(soltest.contracts().size() == 2);
	BOOST_REQUIRE(soltest.soltests("Contract.sol").size() == 2);
	BOOST_REQUIRE(soltest.soltests("OtherContract.sol").size() == 3);
}

BOOST_AUTO_TEST_CASE(soltesting_single_soltest_loading)
{
	std::map<std::string, std::string> soliditySources{{"Contract.sol", R"(
pragma solidity ^0.4.0;

contract Contract {
    function add(uint16 a) public returns (uint16 result)  {
        return a;
    }
}
)"}};
	std::map<std::string, std::string> soltestSources{{"Contract.soltest", R"(
{assert-false}
	assert(false);
{assert-true}
	assert(true);
)"}};
	soltest::Soltest soltest;
	soltest.addSolidityFiles(soliditySources);
	soltest.addSoltestFiles(soltestSources);
	BOOST_REQUIRE(soltest.load());
	BOOST_REQUIRE(soltest.contracts().size() == 1);
	BOOST_REQUIRE(soltest.soltests("Contract.soltest").size() == 2);
}

BOOST_AUTO_TEST_CASE(soltesting_multi_soltest_loading)
{
	std::map<std::string, std::string> soliditySources{
		{"Contract.sol", R"(
pragma solidity ^0.4.0;

import "OtherContract.sol";

contract Contract {
	OtherContract oc;
    function add(uint16 a) public returns (uint16 result)  {
        return a;
    }
}
)"},
		{"OtherContract.sol", R"(
pragma solidity ^0.4.0;

contract OtherContract {
    function add(uint16 a) public returns (uint16 result)  {
        return a;
    }
}
)"}};
	std::map<std::string, std::string> soltestSources{
		{"Contract.soltest", R"(
{assert-false}
	assert(false);
{assert-true}
	assert(true);
)"},
		{"OtherContract.soltest", R"(
{assert-false}
	assert(false);
{assert-true}
	assert(true);
{assert-true-true}
	assert(true);
	assert(true);
)"}};

	soltest::Soltest soltest;
	soltest.addSolidityFiles(soliditySources);
	soltest.addSoltestFiles(soltestSources);
	BOOST_REQUIRE(soltest.load());
	BOOST_REQUIRE(soltest.contracts().size() == 2);
	BOOST_REQUIRE(soltest.soltests("Contract.soltest").size() == 2);
	BOOST_REQUIRE(soltest.soltests("OtherContract.soltest").size() == 3);
}

BOOST_AUTO_TEST_CASE(soltesting_single_solidity_loading)
{
	std::map<std::string, std::string> soliditySources{
		{"Contract.sol", R"(
pragma solidity ^0.4.0;

contract Contract {
    function add(uint16 a) public returns (uint16 result)  {
        return a;
    }
}
)"},
		{"Contract.test.sol", R"ABC(
import 'Contract.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract Contract_Test is Soltest {
	function test_assert_false() {
		assert(false);
	}
	function test_assert_true() {
		assert(true);
	}
}
)ABC"}};
	soltest::Soltest soltest;
	soltest.addSolidityFiles(soliditySources);
	BOOST_REQUIRE(soltest.load());
	BOOST_REQUIRE(soltest.contracts().size() == 1);
	BOOST_REQUIRE(soltest.soltests("Contract.test.sol").size() == 2);
}

BOOST_AUTO_TEST_CASE(soltesting_multi_solidity_loading)
{
	std::map<std::string, std::string> soliditySources{
		{"Contract.sol", R"(
pragma solidity ^0.4.0;

import "OtherContract.sol";

contract Contract {
	OtherContract oc;
    function add(uint16 a) public returns (uint16 result)  {
        return a;
    }
}
)"},
		{"Contract.test.sol", R"ABC(
import 'Contract.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract Contract_Test is Soltest {
	function test_assert_false() {
		assert(false);
	}
	function test_assert_true() {
		assert(true);
	}
}
)ABC"},
		{"OtherContract.sol", R"(
pragma solidity ^0.4.0;

contract OtherContract {
    function add(uint16 a) public returns (uint16 result)  {
        return a;
    }
}
)"},
		{"OtherContract.test.sol", R"ABC(
import 'Contract.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract Contract_Test is Soltest {
	function test_assert_false() {
		assert(false);
	}
	function test_assert_true() {
		assert(true);
	}
	function test_assert_true_true() {
		assert(true);
	}
}
)ABC"}};
	soltest::Soltest soltest;
	soltest.addSolidityFiles(soliditySources);
	BOOST_REQUIRE(soltest.load());
	BOOST_REQUIRE(soltest.contracts().size() == 2);
	BOOST_REQUIRE(soltest.soltests("Contract.test.sol").size() == 2);
	BOOST_REQUIRE(soltest.soltests("OtherContract.test.sol").size() == 3);
}


