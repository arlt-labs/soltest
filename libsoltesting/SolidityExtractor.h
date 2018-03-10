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
/** @file SolidityExtractor.h
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#ifndef SOLTEST_SOLIDITYEXTRACTOR_H
#define SOLTEST_SOLIDITYEXTRACTOR_H

#include <libsolidity/ast/ASTVisitor.h>
#include <libsolidity/parsing/Scanner.h>

namespace soltest
{

class SolidityExtractor : private dev::solidity::ASTConstVisitor
{
public:
	explicit SolidityExtractor(dev::solidity::SourceUnit const &_sourceUnit,
							   std::string _filename, std::string _source,
							   dev::solidity::Scanner const &_scannerFromSourceName);

	std::string const &filename() const
	{
		return m_filename;
	}

	int line(const std::string &testcase)
	{
		return m_lines[testcase];
	}

	std::map<std::string, std::string> const &testcases() const
	{
		return m_content;
	}

private:
	bool visit(dev::solidity::FunctionDefinition const &_node) override;

	std::map<std::string, std::string> m_content;
	std::map<std::string, int> m_lines;
	std::string m_filename;
	std::string m_source;
	dev::solidity::Scanner const &m_scanner;
};

} // namesapce soltest

#endif //SOLTEST_SOLIDITYEXTRACTOR_H
