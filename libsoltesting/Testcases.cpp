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
/** @file Testcases.cpp
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#include <map>
#include <string>
#include <boost/algorithm/string.hpp>
#include "Testcases.h"
#include "Soltest.h"

namespace soltest
{

Testcases::Testcases(const soltest::Soltest *_soltest,
					 std::string const &_filename,
					 std::map<std::string, std::string> &_testcases) : m_soltest(_soltest)
{
	std::map<std::string, std::string> solidityContents = m_soltest->solidityContents();
	std::map<std::string, std::string> solidityTestContents = m_soltest->solidityTestContents();

	m_compiler = std::make_shared<dev::solidity::CompilerStack>(
		[&](std::string const &import) -> dev::solidity::ReadCallback::Result
		{
			dev::solidity::ReadCallback::Result result;
			result.success = true;

			if (solidityContents.find(import) != solidityContents.end())
				result.responseOrErrorMessage = solidityContents[import];
			else  if (solidityTestContents.find(import) != solidityTestContents.end())
				result.responseOrErrorMessage = solidityTestContents[import];
			else
				result.success = false;

			return result;
		}
	);

	if (boost::ends_with(_filename, ".test.sol"))
	{
		m_compiler->addSource(_filename, solidityTestContents[_filename]);
	}
	else
	{
		std::string solidityFile(m_soltest->solidityFile(_filename));
		if (solidityFile.empty())
			solidityFile = _filename;

		(void) _testcases;

		m_compiler->addSource(solidityFile, solidityContents[solidityFile]);
	}
	if (!m_compiler->parseAndAnalyze())
	{
		for (auto& e : m_compiler->errors()) {
			std::cout << e->lineInfo() << " @ " << e->what() << std::endl;
		}
	}
	else
		for (auto &c : m_compiler->contractNames())
		{
			std::cout << c << std::endl;
		}
}

void Testcases::executeTestcase(std::string const &_testcase)
{
	(void) _testcase;
}

} // namespace soltest