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

#include "FunctionFinder.h"

#include <libsolidity/ast/ASTPrinter.h>
#include <libsolidity/parsing/Scanner.h>
#include <libsoltesting/Testcases.h>
#include <boost/algorithm/string/trim.hpp>
#include <memory>

namespace soltest
{
namespace interpreter
{

Interpreter::Interpreter(std::string const& _filename,
						 std::string const& _contractFilename,
						 dev::solidity::CompilerStack const& _compilerStack)
	: m_filename(_filename),
	  m_contractFilename(_contractFilename),
	  m_compilerStack(_compilerStack),
	  m_sourceUnit(m_compilerStack.ast(m_contractFilename))
{
}

void Interpreter::run(std::string const& _testcase)
{
	m_testcase = _testcase;
	m_testcaseNormalized = soltest::Testcases::normalize(_testcase);

	FunctionFinder functionFinder(m_sourceUnit, m_testcaseNormalized);
	dev::solidity::FunctionDefinition const* functionToExecute = functionFinder.functionDefinition();
	if (functionToExecute == nullptr)
	{
		Testcases::Assertion::Ptr assertion(std::make_shared<Testcases::Assertion>(false));
		assertion->testcase = _testcase;
		assertion->what = "Internal function '" + m_testcaseNormalized + "' was not found. This should never happen!";
		m_assertions.push_back(assertion);
	}
	else
		functionToExecute->accept(*this);
}

bool Interpreter::visit(const dev::solidity::VariableDeclarationStatement& _node)
{
	return ASTConstVisitor::visit(_node);
}

void Interpreter::endVisit(const dev::solidity::VariableDeclaration& _node)
{
	ASTConstVisitor::endVisit(_node);
}

void Interpreter::endVisit(const dev::solidity::Assignment& _node)
{
	ASTConstVisitor::endVisit(_node);
}

void Interpreter::endVisit(const dev::solidity::UnaryOperation& _node)
{
	ASTConstVisitor::endVisit(_node);
}

void Interpreter::endVisit(const dev::solidity::BinaryOperation& _node)
{
	ASTConstVisitor::endVisit(_node);
}

void Interpreter::addAssertion(bool _assertion, dev::SourceLocation const& _location)
{
	dev::solidity::Error error(dev::solidity::Error::Type::Warning, _location);
	Testcases::Error::Ptr errorPtr =
		Testcases::CreateError(m_filename, error, m_compilerStack);

	std::string assertionWhat(errorPtr->what);
	boost::trim(assertionWhat);
	if (assertionWhat.find("assert(") != std::string::npos && assertionWhat.rfind(");") != std::string::npos)
	{
		assertionWhat = assertionWhat.substr(assertionWhat.find("assert("));
		assertionWhat = assertionWhat.substr(0, assertionWhat.rfind(");") + 2);
	}

	Testcases::Assertion::Ptr assertion;
	assertion = std::make_shared<Testcases::Assertion>(_assertion);
	assertion->file = m_filename;
	assertion->line = errorPtr->line;
	assertion->column = errorPtr->column;
	assertion->testcase = m_testcase;
	assertion->what = assertionWhat;
	m_assertions.push_back(assertion);
//	std::cout << "assert(" << std::boolalpha << _assertion << ");" << std::endl;
}

void Interpreter::endVisit(const dev::solidity::FunctionCall& _functionCall)
{
	// m_stack.print();
	Stack::Type first = m_stack.first();
	if (first.type() == typeid(Literal))
	{
		Literal literal = boost::get<Literal>(m_stack.pop());
		bool boolLiteral = false;
		if (literal.value == dev::solidity::Token::FalseLiteral)
			boolLiteral = false;
		if (literal.value == dev::solidity::Token::TrueLiteral)
			boolLiteral = true;
		first = m_stack.first();
		if (first.type() == typeid(Identifier))
		{
			Identifier identifier = boost::get<Identifier>(m_stack.pop());
			if (identifier.name == "assert" && identifier.type == "function (bool) pure")
				addAssertion(boolLiteral, _functionCall.location());
		}
	}
	ASTConstVisitor::endVisit(_functionCall);
}

void Interpreter::endVisit(const dev::solidity::NewExpression& _node)
{
	ASTConstVisitor::endVisit(_node);
}

void Interpreter::endVisit(const dev::solidity::MemberAccess& _node)
{
	ASTConstVisitor::endVisit(_node);
}

void Interpreter::endVisit(const dev::solidity::IndexAccess& _node)
{
	ASTConstVisitor::endVisit(_node);
}

void Interpreter::endVisit(const dev::solidity::Identifier& _identifier)
{
	dev::solidity::TypePointer type = _identifier.annotation().type;
	soltest::interpreter::Identifier identifier;
	identifier.name = _identifier.name();
	if (type != nullptr)
		identifier.type = _identifier.annotation().type->toString();
	m_stack.push_back(identifier);
	ASTConstVisitor::endVisit(_identifier);
}

void Interpreter::endVisit(const dev::solidity::Literal& _literal)
{
	dev::solidity::Token::Value token(_literal.token());
	if (token == dev::solidity::Token::FalseLiteral || token == dev::solidity::Token::TrueLiteral)
		m_stack.push_back(soltest::interpreter::Literal(token));
	ASTConstVisitor::endVisit(_literal);
}

} // namespace interpreter
} // namespace soltest
