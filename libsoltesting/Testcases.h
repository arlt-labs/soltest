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
/** @file Testcases.h
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#ifndef SOLTEST_TESTCASES_H
#define SOLTEST_TESTCASES_H

#include <libsolidity/interface/CompilerStack.h>

#include <Poco/SharedPtr.h>

#include <memory>

namespace soltest
{

class Soltest;

class Testcases
{
public:
	typedef typename Poco::SharedPtr<Testcases> Ptr;

	Testcases(const soltest::Soltest* _soltest, std::string _filename, std::map<std::string, std::string> _testcases);

	std::string normalize(std::string const& name);

	void executeTestcase(std::string const &_testcase);

	std::string formattedErrorMessage(std::string const& _filename, dev::solidity::Error const &_error);

private:
	bool m_errors;
	const soltest::Soltest* m_soltest;
	std::function<const dev::solidity::Scanner &(const std::string &)> m_scannerFromSourceName;
	std::shared_ptr<dev::solidity::CompilerStack> m_compiler;
};

} // namespace soltest

#endif //SOLTEST_TESTCASES_H
