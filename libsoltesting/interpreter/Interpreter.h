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
/** @file Interpreter.h
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#ifndef SOLTEST_INTERPRETER_H
#define SOLTEST_INTERPRETER_H

#include <libsolidity/ast/ASTVisitor.h>
#include <libsoltesting/Testcases.h>

namespace soltest
{
namespace interpeter
{

class Interpreter: private dev::solidity::ASTConstVisitor
{
public:
	explicit Interpreter(dev::solidity::SourceUnit const& _sourceUnit);

	void run(std::string const& _testcase);

	std::vector<soltest::Testcases::Assertion::Ptr> const& assertions() const
	{
		return m_assertions;
	}

private:
	std::string m_testcase;
	std::string m_testcaseNormalized;
	dev::solidity::SourceUnit const& m_sourceUnit;
	std::vector<soltest::Testcases::Assertion::Ptr> m_assertions;
};

} // namespace interpreter
} // namespace soltest

#endif //SOLTEST_INTERPRETER_H
