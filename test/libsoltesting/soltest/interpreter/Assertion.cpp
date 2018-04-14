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
/** @file Assertion.cpp
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 * Soltest tests.
 */

#include <string>

#include <boost/test/unit_test.hpp>

#include <libsoltesting/Soltest.h>

BOOST_AUTO_TEST_CASE(soltesting_single_embedded_simple_assertion)
{
	std::map<std::string, std::string> sources{{"Contract.sol", R"(
pragma solidity ^0.4.0;

contract Contract {
    /// @ext:soltest
    /// {assert-false}
    ///     assert(false);
    /// {assert-true}
    ///     assert(true);
    /// {assert-false-true}
    ///     assert(false);
    ///     assert(true);
    /// {assert-true-false}
    ///     assert(true);
    ///     assert(false);
    function add(uint16 a) public returns (uint16 result)  {
        return a;
    }
}
)"}};
	soltest::Soltest soltest;
	soltest.addSolidityFiles(sources);
	BOOST_REQUIRE(soltest.load());
	BOOST_REQUIRE(soltest.contracts().size() == 1);
	BOOST_REQUIRE(soltest.soltests("Contract.sol").size() == 4);
	soltest.runTestcases();
	std::map<std::string, std::vector<bool>> assertions;
	for (auto& testcase : soltest.testcases())
		for (auto& assertion : testcase.second->assertions())
			for (auto& a : assertion.second)
				assertions[a->testcase].push_back(a->result);

	BOOST_REQUIRE(assertions.find("assert-false") != assertions.end());
	BOOST_REQUIRE(assertions.find("assert-true") != assertions.end());
	BOOST_REQUIRE(assertions.find("assert-false-true") != assertions.end());
	BOOST_REQUIRE(assertions.find("assert-true-false") != assertions.end());

	BOOST_REQUIRE(assertions.find("assert-false")->second.size() == 1);
	BOOST_REQUIRE(assertions.find("assert-true")->second.size() == 1);
	BOOST_REQUIRE(assertions.find("assert-false-true")->second.size() == 2);
	BOOST_REQUIRE(assertions.find("assert-true-false")->second.size() == 2);

	BOOST_REQUIRE(!assertions.find("assert-false")->second[0]);
	BOOST_REQUIRE(assertions.find("assert-true")->second[0]);
	BOOST_REQUIRE(!assertions.find("assert-false-true")->second[0]);
	BOOST_REQUIRE(assertions.find("assert-false-true")->second[1]);
	BOOST_REQUIRE(assertions.find("assert-true-false")->second[0]);
	BOOST_REQUIRE(!assertions.find("assert-true-false")->second[1]);
}
