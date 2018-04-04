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
	struct Error
	{
		typedef typename std::shared_ptr<Error> Ptr;
		std::string file;
		std::string testcase;
		int line;
		int column;
		std::string what;
	};

	struct Assertion: public Error
	{
		typedef typename std::shared_ptr<Assertion> Ptr;
		explicit Assertion(bool result) : result(result) {}
		bool result;
	};

	typedef typename Poco::SharedPtr<Testcases> Ptr;

	Testcases(const soltest::Soltest* _soltest, std::string _filename, std::map<std::string, std::string> _testcases);

	static std::string normalize(std::string const& name);

	void executeTestcase(std::string const& _testcase);

	Error::Ptr createError(std::string const& _filename,
						   dev::solidity::Error const& _error,
						   std::string const& _realFilename = "");

	std::vector<Error::Ptr> const& errors() const
	{
		return m_errors;
	}

	std::vector<Error::Ptr> const& warnings() const
	{
		return m_warnings;
	}

	std::map<std::string, std::vector<Assertion::Ptr>> const& assertions() const
	{
		return m_assertions;
	};

private:
	std::vector<Error::Ptr> m_errors;
	std::vector<Error::Ptr> m_warnings;
	std::map<std::string, std::vector<Assertion::Ptr>> m_assertions;

	const soltest::Soltest* m_soltest;
	std::string m_filename;
	std::function<const dev::solidity::Scanner&(const std::string&)> m_scannerFromSourceName;
	std::shared_ptr<dev::solidity::CompilerStack> m_compiler;

	std::string m_testContractFileName;
	std::string m_testContractName;

	Poco::Mutex m_mutex;
};

} // namespace soltest

#endif //SOLTEST_TESTCASES_H
