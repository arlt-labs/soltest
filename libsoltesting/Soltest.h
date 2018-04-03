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
/** @file Soltest.h
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#ifndef SOLTEST_SOLTEST_H
#define SOLTEST_SOLTEST_H

#include <libsoltesting/SolidityExtractor.h>
#include <libsoltesting/Environment.h>
#include <libsoltesting/Task.h>
#include <libsoltesting/Testcases.h>

#include <libsolidity/interface/CompilerStack.h>

#include <Poco/ThreadPool.h>
#include <Poco/NotificationQueue.h>

#include <string>
#include <set>
#include <map>
#include <memory>
#include <mutex>

namespace soltest
{

class Soltest
{
public:
	struct Error
	{
		typedef typename std::shared_ptr<Error> Ptr;
		std::string file;
		size_t line;
		std::string what;
	};

	typedef std::map<dev::solidity::Error::Type, dev::solidity::ErrorList> CompilerErrors;
	typedef std::map<dev::solidity::Error::Type, std::vector<Error::Ptr>> SoltestErrors;

	Soltest();

	bool parseCommandLineArguments(int argc, char **argv);

	bool initialize();

	void addSolidityFile(std::string const &solidityFile, std::string const &solidityFileContent);

	bool addSolidityFile(std::string const &solidityFile);

	void addSoltestFile(std::string const &soltestFile, std::string const &soltestFileContent);

	bool addSoltestFile(std::string const &soltestFile);

	bool addAbiFile(std::string const &abiFile);

	void addAbiFile(std::string const &abiFile, std::string const &abiFileContent, std::string const &binFileContent);

	void searchSoltestFiles();

	bool loadContracts();

	bool loadTestcases();

	bool generateTestcases();

	void runTestcases();

	CompilerErrors const &compilerErrors() const
	{
		return m_compilerErrors;
	}

	SoltestErrors const &soltestErrors() const
	{
		return m_soltestErrors;
	}

	std::function<const dev::solidity::Scanner &(const std::string &)> scannerFromSourceName() const
	{
		return m_scannerFromSourceName;
	}

	std::set<std::string> const &contracts() const
	{
		return m_contracts;
	}

	std::map<std::string, std::map<std::string, std::string>> const &soltests() const
	{
		return m_soltests;
	};

	int soltestLine(std::string const &soltestFile, std::string const &testcase) const
	{
		auto file = m_soltestsLine.find(soltestFile);
		if (file != m_soltestsLine.end()) {
			auto line = file->second.find(testcase);
			if (line != file->second.end()) {
				return line->second;
			}
		}
		return 0;
	}

	std::map<std::string, std::string> const &solidityContents() const
	{
		return m_solidityContents;
	}

	std::map<std::string, std::string> const &solidityTestContents() const
	{
		return m_solidityTestContents;
	}

	std::map<std::string, std::string> const &soltestContents() const
	{
		return m_soltestContents;
	}

	std::map<std::string, std::pair<std::string, std::string>> const &abiContents() const
	{
		return m_abiContents;
	}

	std::string solidityFile(std::string const &soltestFile) const
	{
		auto iter = m_soltestSolidityFile.find(soltestFile);
		if (iter != m_soltestSolidityFile.end())
		{
			return iter->second;
		}
		return "";
	}

	unsigned int threads()
	{
		return m_threads;
	}

	std::string testcaseName(std::string const &_filename, int _line) const;

	std::map<std::string, soltest::Testcases::Ptr> testcases()
	{
		Poco::Mutex::ScopedLock scopedLock(m_testcases_mutex);
		return this->m_testcases;
	};

private:
	void preloadContracts();

	bool parseSoltest(uint32_t _line, std::string const &_filename, std::string const &_content);

	void parseSoltest(SolidityExtractor &_extractor);

	std::map<std::string, std::string> m_options;

	std::string m_ipcpath;

	unsigned int m_threads;
	unsigned int m_solidityThreads;

	Poco::SharedPtr<Poco::ThreadPool> m_solidityThreadPool;
	Poco::SharedPtr<Poco::ThreadPool> m_testcaseThreadPool;

	std::set<std::string> m_contracts;
	std::set<std::string> m_testContracts;

	std::map<std::string, std::string> m_solidityContents;                       ///< for .sol files
	std::map<std::string, std::string> m_solidityTestContents;                   ///< for .test.sol files
	std::map<std::string, std::string> m_soltestContents;                        ///< for .soltest files
	std::map<std::string, std::pair<std::string, std::string>> m_abiContents;    ///< for .abi + .bin files

	std::map<std::string, std::string> m_soltestSolidityFile;

	std::map<std::string, std::map<std::string, std::string>> m_soltests;
	std::map<std::string, std::map<std::string, int>> m_soltestsLine;

	dev::solidity::CompilerStack m_compiler;
	dev::solidity::CompilerStack m_testCompiler;
	std::function<const dev::solidity::Scanner &(const std::string &)> m_scannerFromSourceName;

	CompilerErrors m_compilerErrors;
	SoltestErrors m_soltestErrors;

	soltest::Environment m_environment;

	Poco::Mutex m_testcases_mutex;
	std::map<std::string, soltest::Testcases::Ptr> m_testcases;
};

} // namespace soltest

#endif //SOLTEST_SOLTEST_H
