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
/** @file Interpreter.cpp
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#include "Interpreter.h"

#include <libsoltesting/Testcases.h>

namespace soltest
{
namespace interpeter
{

Interpreter::Interpreter(dev::solidity::SourceUnit const& _sourceUnit) : m_sourceUnit(_sourceUnit)
{
	(void) m_sourceUnit;
}

void Interpreter::run(std::string const& _testcase)
{
	m_testcase = _testcase;
	m_testcaseNormalized = "test_" + soltest::Testcases::normalize(_testcase);
}

} // namespace interpreter
} // namespace soltest
