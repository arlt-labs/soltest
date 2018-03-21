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
/** @file Environment.cpp
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#include "Environment.h"

namespace soltest
{

void Environment::load(dev::solidity::CompilerStack &_compilerStack)
{
	(void) _compilerStack;
}

void Environment::reset()
{

}

std::string Environment::contracts() const
{
	return R"(
pragma solidity ^0.4.0;

contract Soltest {
    function Soltest(){
    }
}
	)";
}

} // namespace soltest
