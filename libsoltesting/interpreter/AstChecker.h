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
#include <libsolidity/parsing/Scanner.h>

#include <utility>

namespace soltest
{

namespace interpeter
{

class AstChecker : private dev::solidity::ASTConstVisitor
{
public:
	explicit AstChecker(dev::solidity::SourceUnit const &_ast)
		: m_valid(true),
		  m_interesting(false),
		  m_blocks(0),
		  m_errors({})
	{
		_ast.accept(*this);
	}

	bool isValid() const
	{
		return m_valid;
	}

	std::vector<std::shared_ptr<dev::solidity::Error>> const &errors() const
	{
		return this->m_errors;
	}

private:
	std::shared_ptr<dev::solidity::Error> createError(dev::solidity::ASTNode const &astNode, std::string const &what)
	{
		std::shared_ptr<dev::solidity::Error> result;
		result.reset(new dev::solidity::Error(dev::solidity::Error::Type::SyntaxError, astNode.location(), what));
		return result;
	}

	bool visit(dev::solidity::Block const &_node) override
	{
		++m_blocks;
		if (m_blocks > 1)
		{
			m_valid = false;
			m_errors.push_back(createError(_node, "Nested blocks are not allowed in test-cases."));
		}
		return visitNode(_node);
	}

	void endVisit(dev::solidity::Block const &_node) override
	{
		--m_blocks;
		return ASTConstVisitor::endVisit(_node);
	}

	bool visit(dev::solidity::FunctionDefinition const &_node) override
	{
		m_interesting = boost::starts_with(_node.name(), "test");
		return visitNode(_node);
	}

	bool visit(dev::solidity::IfStatement const &_node) override
	{
		if (m_interesting)
			m_errors.push_back(createError(_node, "'If' statements not allowed in test-cases."));
		return visitNode(_node);
	}

	bool visit(dev::solidity::WhileStatement const &_node) override
	{
		if (m_interesting)
			m_errors.push_back(createError(_node, "'While' statements not allowed in test-cases."));
		return visitNode(_node);
	}

	bool visit(dev::solidity::ForStatement const &_node) override
	{
		if (m_interesting)
			m_errors.push_back(createError(_node, "'For' statements not allowed in test-cases."));
		return visitNode(_node);
	}

	bool visit(dev::solidity::Continue const &_node) override
	{
		if (m_interesting)
			m_errors.push_back(createError(_node, "'Continue' statements not allowed in test-cases."));
		return visitNode(_node);
	}

	bool visit(dev::solidity::InlineAssembly const &_node) override
	{
		if (m_interesting)
			m_errors.push_back(createError(_node, "'InlineAssembly' statements not allowed in test-cases."));
		return visitNode(_node);
	}

	bool visit(dev::solidity::Break const &_node) override
	{
		if (m_interesting)
			m_errors.push_back(createError(_node, "'Break' statements not allowed in test-cases."));
		return visitNode(_node);
	}

	bool visit(dev::solidity::Return const &_node) override
	{
		if (m_interesting)
			m_errors.push_back(createError(_node, "'Return' statements not allowed in test-cases."));
		return visitNode(_node);
	}

	bool visit(dev::solidity::Throw const &_node) override
	{
		if (m_interesting)
			m_errors.push_back(createError(_node, "'Throw' statements not allowed in test-cases."));
		return visitNode(_node);
	}

	bool visit(dev::solidity::Conditional const &_node) override
	{
		if (m_interesting)
			m_errors.push_back(createError(_node, "'Conditional' statements not allowed in test-cases."));
		return visitNode(_node);
	}

	bool m_valid;
	bool m_interesting;
	int m_blocks;
	std::vector<std::shared_ptr<dev::solidity::Error>> m_errors;
};

} // namespace interpreter

} // namespace soltest

#endif //SOLTEST_INTERPRETER_ASTCHECKER_H
