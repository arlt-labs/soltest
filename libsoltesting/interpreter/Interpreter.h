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

#include "Stack.h"

#include <libsoltesting/Testcases.h>

#include <libevmasm/SourceLocation.h>
#include <libsolidity/ast/ASTVisitor.h>

namespace soltest
{
namespace interpreter
{

class Interpreter: private dev::solidity::ASTConstVisitor
{
public:
	Interpreter(std::string const& _filename,
				std::string const& _contractFilename,
				dev::solidity::CompilerStack const& compilerStack);

	void run(std::string const& _testcase);

	std::vector<soltest::Testcases::Assertion::Ptr> const& assertions() const
	{
		return m_assertions;
	}

private:
	void addAssertion(bool _assertion, dev::SourceLocation const& _location);

	bool visit(const dev::solidity::VariableDeclarationStatement& _node) override;
	void endVisit(const dev::solidity::VariableDeclaration& _node) override;
	void endVisit(const dev::solidity::Assignment& _node) override;
	void endVisit(const dev::solidity::UnaryOperation& _node) override;
	void endVisit(const dev::solidity::BinaryOperation& _node) override;
	void endVisit(const dev::solidity::FunctionCall& _functionCall) override;
	void endVisit(const dev::solidity::NewExpression& _node) override;
	void endVisit(const dev::solidity::MemberAccess& _node) override;
	void endVisit(const dev::solidity::IndexAccess& _node) override;
	void endVisit(const dev::solidity::Identifier& _identifier) override;
	void endVisit(const dev::solidity::Literal& _literal) override;

	std::string m_filename;
	std::string m_contractFilename;
	dev::solidity::CompilerStack const& m_compilerStack;
	std::string m_testcase;
	std::string m_testcaseNormalized;
	dev::solidity::SourceUnit const& m_sourceUnit;
	std::vector<soltest::Testcases::Assertion::Ptr> m_assertions;

	soltest::interpreter::Stack m_stack;
};

} // namespace interpreter
} // namespace soltest

#endif //SOLTEST_INTERPRETER_H
