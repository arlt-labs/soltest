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
/** @file AstChecker.h
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#ifndef SOLTEST_INTERPRETER_ASTCHECKER_H
#define SOLTEST_INTERPRETER_ASTCHECKER_H

#include <libdevcore/Common.h>
#include <libevmasm/SourceLocation.h>
#include <libsolidity/ast/ASTVisitor.h>
#include <libsolidity/codegen/LValue.h>
#include <libsolidity/interface/Exceptions.h>

namespace soltest
{

namespace interpeter
{

class AstChecker : private dev::solidity::ASTConstVisitor
{
public:
	explicit AstChecker(dev::solidity::SourceUnit const &ast) : m_ast(ast)
	{
		ast.accept(*this);
		(void) m_ast;
	}

private:
	dev::solidity::SourceUnit const &m_ast;

};

} // namespace interpreter

} // namespace soltest

#endif //SOLTEST_INTERPRETER_ASTCHECKER_H
