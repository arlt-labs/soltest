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
/** @file SolidityExtractor.cpp
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#include "SolidityExtractor.h"

#include <boost/algorithm/string.hpp>

namespace soltest
{

SolidityExtractor::SolidityExtractor(dev::solidity::SourceUnit const& _sourceUnit,
									 std::string _filename, std::string _source,
									 dev::solidity::Scanner const& _scanner)
	: m_filename(std::move(_filename)), m_source(std::move(_source)), m_scanner(_scanner)
{
	_sourceUnit.accept(*this);
}

bool SolidityExtractor::visit(dev::solidity::FunctionDefinition const& _node)
{
	if (boost::starts_with(_node.name(), "test"))
	{
		int start(_node.body().location().start + 2); // skip {\n
		int end(_node.body().location().end - start - 4); // and }\n
		std::tuple<int, int> startTuple = m_scanner.translatePositionToLineColumn(start);
		int currentLine = std::get<0>(startTuple);
		m_lines[_node.name()] = currentLine;
		std::string body(m_source.substr(static_cast<unsigned long>(start), static_cast<unsigned long>(end)));
		std::vector<std::string> lines;
		boost::split(lines, body, boost::is_any_of("\n"));
		std::stringstream stream;
		for (auto& line : lines)
		{
			boost::trim(line);
			if (!line.empty())
				stream << line << " //" << "soltest_line:" << (currentLine + 1) << std::endl;
			++currentLine;
		}
		m_content[_node.name()] = stream.str();
	}
	return visitNode(_node);
}

} // namespace soltest
