//
// Created by Alexander Arlt on 04.04.18.
//

#ifndef SOLTEST_FUNCTIONFINDER_H
#define SOLTEST_FUNCTIONFINDER_H

namespace soltest
{

namespace interpreter
{

class FunctionFinder: private dev::solidity::ASTConstVisitor
{
public:
	FunctionFinder(dev::solidity::SourceUnit const& _sourceUnit, std::string const& _function)
		: m_function(_function), m_functionDefinition(nullptr)
	{
		_sourceUnit.accept(*this);
	}

	dev::solidity::FunctionDefinition const* functionDefinition() const
	{
		return m_functionDefinition;
	}

private:
	bool visit(dev::solidity::FunctionDefinition const& _node) override
	{
		if (_node.name() == m_function)
			m_functionDefinition = &_node;
		return visitNode(_node);
	}

	std::string const& m_function;
	dev::solidity::FunctionDefinition const* m_functionDefinition;
};

} // namespace interpreter
} // namespace soltest

#endif //SOLTEST_FUNCTIONFINDER_H
