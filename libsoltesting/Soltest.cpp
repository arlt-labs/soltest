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
/** @file Soltest.cpp
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#include "Soltest.h"
#include "SolidityExtractor.h"
#include "Executor.h"

#include <libdevcore/JSON.h>
#include <boost/test/unit_test.hpp>
#include <boost/filesystem.hpp>

#include <boost/algorithm/string.hpp>
#include <Poco/ThreadPool.h>

#include <thread>

#include <fstream>

namespace soltest
{

Soltest::Soltest()
{
	m_threads = std::thread::hardware_concurrency();
	m_solidityThreads = 1;
	if (m_threads == 0)
		m_threads = 1;
	m_scannerFromSourceName =
		[&](std::string const &_sourceName) -> dev::solidity::Scanner const &
		{
			if (boost::ends_with(_sourceName, ".test.sol") || boost::ends_with(_sourceName, "Soltest.sol"))
				return m_testCompiler.scanner(_sourceName);
			else
				return m_compiler.scanner(_sourceName);
		};
}

bool Soltest::parseCommandLineArguments(int argc, char **argv)
{
	for (auto i = 0; i < argc; i++)
	{
		std::string argument(argv[i]);
		std::string absolutePath(argument);
		if (!boost::filesystem::path(argument).is_absolute())
			absolutePath =
				boost::filesystem::current_path().string() + boost::filesystem::path::preferred_separator + argument;
		if (argument == "--ipcpath")
		{
			m_options[argument] = argv[i + 1];
			m_ipcpath = argv[i + 1];
			++i;
		}
		else if (argument == "--solidity-threads")
		{
			m_options[argument] = argv[i + 1];
			try
			{
				m_solidityThreads = boost::lexical_cast<unsigned int>(argv[i + 1]);
				if (m_solidityThreads > 64)
					m_solidityThreads = std::thread::hardware_concurrency();
			}
			catch (...)
			{
				m_solidityThreads = 1;
			}
			if (m_solidityThreads == 0)
				m_solidityThreads = 1;
			++i;
		}
		else if (argument == "--threads")
		{
			m_options[argument] = argv[i + 1];
			try
			{
				m_threads = boost::lexical_cast<unsigned int>(argv[i + 1]);
				if (m_threads > 64)
					m_threads = std::thread::hardware_concurrency();
			}
			catch (...)
			{
				m_threads = std::thread::hardware_concurrency();
			}
			if (m_threads == 0)
				m_threads = 1;
			++i;
		}
		else if (boost::starts_with(argument, "-"))
			m_options[argument] = "yes";
		else if (boost::filesystem::exists(absolutePath))
			if (boost::filesystem::extension(absolutePath) == ".abi")
				addAbiFile(absolutePath);
		if (boost::filesystem::extension(absolutePath) == ".sol")
			addSolidityFile(absolutePath);
		else if (boost::filesystem::extension(absolutePath) == ".soltest")
		{
			std::string contractFile(absolutePath.substr(0, absolutePath.length() - 4));
			addSoltestFile(absolutePath);
			if (boost::filesystem::exists(contractFile))
				addSolidityFile(contractFile);
		}
	}
	addSolidityFile("Soltest.sol", m_environment.contracts());
	return initialize();
}

bool Soltest::initialize()
{
	m_solidityThreadPool = new Poco::ThreadPool(m_solidityThreads);
	m_testcaseThreadPool = new Poco::ThreadPool(m_threads);

	preloadContracts();
	searchSoltestFiles();
	return !m_solidityContents.empty() || !m_solidityTestContents.empty();
}

void Soltest::preloadContracts()
{
	dev::solidity::ErrorList testCompilerErrors;
	dev::solidity::ErrorList compilerErrors;

	dev::solidity::CompilerStack testCompilerStack;
	for (auto &solidityContent : m_solidityTestContents)
		testCompilerStack.addSource(solidityContent.first, solidityContent.second);
	testCompilerStack.parseAndAnalyze();
	for (auto const &error: testCompilerStack.errors())
		if (error->type() != dev::solidity::Error::Type::Warning)
			testCompilerErrors.push_back(error);
	if (testCompilerErrors.empty() && !m_solidityTestContents.empty())
		for (auto &contract : testCompilerStack.contractNames())
			m_testContracts.insert(contract);

	m_environment.reset();
	m_environment.load(testCompilerStack);

	dev::solidity::CompilerStack compilerStack;
	for (auto &solidityContent : m_solidityContents)
		compilerStack.addSource(solidityContent.first, solidityContent.second);
	compilerStack.parseAndAnalyze();
	for (auto const &error: compilerStack.errors())
		if (error->type() != dev::solidity::Error::Type::Warning)
			compilerErrors.push_back(error);
	if (compilerErrors.empty() && !m_solidityContents.empty())
		for (auto &contract : compilerStack.contractNames())
			m_contracts.insert(contract);
}

void Soltest::searchSoltestFiles()
{
	for (auto &solidityContent : m_solidityContents)
	{
		std::string soltestFile = boost::filesystem::path(solidityContent.first).string() + "test";
		if (boost::filesystem::exists(soltestFile))
		{
			addSoltestFile(soltestFile);
			m_soltestSolidityFile[soltestFile] = solidityContent.first;
		}
	}
	for (auto &contract : m_contracts)
	{
		std::vector<std::string> contractComponents;
		boost::split(contractComponents, contract, boost::is_any_of(":"));
		if (contractComponents.size() == 2)
		{
			std::string solidityFile(contractComponents[0]);
			std::string contractName(contractComponents[1]);
			std::string soltestFile(boost::filesystem::path(solidityFile).parent_path().string()
										+ boost::filesystem::path::preferred_separator + contractName + ".soltest");
			if (boost::filesystem::exists(soltestFile))
			{
				addSoltestFile(soltestFile);
				m_soltestSolidityFile[soltestFile] = solidityFile;
			}
			else if (soltestFile.length() > 1 && boost::filesystem::exists(soltestFile.substr(1)))
			{
				addSoltestFile(soltestFile.substr(1));
				m_soltestSolidityFile[soltestFile.substr(1)] = solidityFile;
			}
		}
	}
}

bool Soltest::addSolidityFile(std::string const &solidityFile)
{
	if (boost::filesystem::exists(solidityFile))
	{
		std::ifstream file(solidityFile);
		std::stringstream content;
		content << file.rdbuf();

		addSolidityFile(solidityFile, content.str());
		return true;
	}
	return false;
}

void Soltest::addSolidityFile(std::string const &solidityFile, std::string const &solidityFileContent)
{
	std::string relative(solidityFile);
	boost::replace_first(relative,
						 boost::filesystem::current_path().string() + boost::filesystem::path::preferred_separator,
						 "");
	if (boost::ends_with(solidityFile, "Soltest.sol"))
		m_solidityTestContents[solidityFile] = solidityFileContent;
	else if (boost::ends_with(relative, ".test.sol"))
		m_solidityTestContents[relative] = solidityFileContent;
	else
	{
		m_solidityContents[relative] = solidityFileContent;
		m_solidityTestContents[relative] = solidityFileContent;
	}
}

bool Soltest::addSoltestFile(std::string const &soltestFile)
{
	if (boost::filesystem::exists(soltestFile))
	{
		std::ifstream file(soltestFile);
		std::stringstream content;
		content << file.rdbuf();

		addSoltestFile(soltestFile, content.str());
		return true;
	}
	return false;
}

void Soltest::addSoltestFile(std::string const &soltestFile, std::string const &soltestFileContent)
{
	std::string relative(soltestFile);
	boost::replace_first(relative,
						 boost::filesystem::current_path().string() + boost::filesystem::path::preferred_separator,
						 "");
	m_soltestContents[relative] = soltestFileContent;
}

bool Soltest::addAbiFile(std::string const &abiFile)
{
	std::string binFile(abiFile);
	boost::replace_last(binFile, ".abi", ".bin");
	if (boost::filesystem::exists(abiFile))
	{
		if (boost::filesystem::exists(binFile))
		{
			std::ifstream abiFileStream(abiFile);
			std::stringstream abiFileContent;
			abiFileContent << abiFileStream.rdbuf();

			std::ifstream binFileStream(binFile);
			std::stringstream binFileContent;
			binFileContent << binFileStream.rdbuf();

			addAbiFile(abiFile, abiFileContent.str(), binFileContent.str());

			return true;
		}
		else
		{
			Error::Ptr error = std::make_shared<Error>();
			error->file = abiFile;
			error->line = 0;
			std::stringstream message;
			message << "Binary file " << binFile << " was not found.";
			error->what = message.str();
			m_soltestErrors[dev::solidity::Error::Type::DeclarationError].push_back(error);
		}
	}
	return false;
}

void Soltest::addAbiFile(std::string const &abiFile,
						 std::string const &abiFileContent,
						 std::string const &binFileContent)
{
	std::string relative(abiFile);
	boost::replace_first(relative,
						 boost::filesystem::current_path().string() + boost::filesystem::path::preferred_separator,
						 "");
	std::pair<std::string, std::string> abiBinaryPair;
	abiBinaryPair.first = abiFileContent;
	abiBinaryPair.second = binFileContent;
	m_abiContents[relative] = abiBinaryPair;
}

bool Soltest::loadContracts()
{
	dev::solidity::ErrorList errors;

	m_compiler.reset();
	for (auto &solidityContent : m_solidityContents)
		m_compiler.addSource(solidityContent.first, solidityContent.second);
	m_compiler.parseAndAnalyze();
	for (auto const &error: m_compiler.errors())
	{
		m_compilerErrors[error->type()].push_back(error);
		if (error->type() != dev::solidity::Error::Type::Warning)
			errors.push_back(error);
	}

	m_testCompiler.reset();
	for (auto &solidityContent : m_solidityTestContents)
		m_testCompiler.addSource(solidityContent.first, solidityContent.second);
	m_testCompiler.parseAndAnalyze();
	for (auto const &error: m_testCompiler.errors())
	{
		m_compilerErrors[error->type()].push_back(error);
		if (error->type() != dev::solidity::Error::Type::Warning)
			errors.push_back(error);
	}
	// todo: generate test environment contracts, compile them & finally check for errors
	return errors.empty();
}

bool Soltest::loadTestcases()
{
	m_soltests.clear();
	m_soltestsLine.clear();

	bool success = true;
	for (auto &soltestContent : m_soltestContents)
	{
		success &= parseSoltest(1, soltestContent.first, soltestContent.second);
		if (!success)
			break;
	}
	for (auto &contract : m_contracts)
	{
		std::vector<std::string> components;
		boost::split(components, contract, boost::is_any_of(":"));
		Json::Value devDoc = m_compiler.natspecDev(contract);
		success &= components.size() == 2;
		if (!success)
			break;
		// parse contract annotation
		parseSoltest(devDoc["external"]["soltest"]["line"].asUInt() + 1,
					 components[0],
					 devDoc["external"]["soltest"]["content"].asString());
		// parse method annotations
		for (auto &method : devDoc["methods"])
			parseSoltest(method["external"]["soltest"]["line"].asUInt() + 1,
						 components[0],
						 method["external"]["soltest"]["content"].asString());
	}
	for (auto &contract : m_testContracts)
	{
		std::vector<std::string> components;
		boost::split(components, contract, boost::is_any_of(":"));
		success &= components.size() == 2;
		if (!success)
			break;
		if (components[0].find(".test.sol") != std::string::npos)
		{
			SolidityExtractor extractor(m_testCompiler.ast(components[0]),
										components[0],
										m_solidityTestContents[components[0]],
										m_scannerFromSourceName(components[0]));
			parseSoltest(extractor);
		}
	}
	return success;
}

void Soltest::parseSoltest(SolidityExtractor &_extractor)
{
	std::map<std::string, std::string> testcases = _extractor.testcases();
	for (auto &testcase : testcases)
	{
		m_soltests[_extractor.filename()][testcase.first] = testcase.second;
		m_soltestsLine[_extractor.filename()][testcase.first] = _extractor.line(testcase.first);
	}
}

bool Soltest::parseSoltest(uint32_t _line, std::string const &_filename, std::string const &_content)
{
	bool result = true;
	std::stringstream content(_content);
	std::string section;
	uint32_t lineCounter(_line);
	std::map<std::string, uint32_t> lines;
	std::map<std::string, std::stringstream> sections;
	for (std::string line; getline(content, line);)
	{
		std::string trimmed(line);
		boost::trim(trimmed);
		if (boost::starts_with(trimmed, "{") && boost::ends_with(trimmed, "}"))
		{
			section = trimmed;
			if (section.length() > 2)
			{
				section = (section.substr(1, section.length() - 2));
				if (lines.find(section) == lines.end())
					lines[section] = lineCounter;
				else
				{
					result = false;
					Error::Ptr error = std::make_shared<Error>();
					error->file = _filename;
					error->line = lineCounter;
					std::stringstream message;
					message << "Redefinition of test-case '" << section << "'. "
							<< "Already declared in " << error->file << ":" << lines[section] << ".";
					error->what = message.str();
					m_soltestErrors[dev::solidity::Error::Type::DeclarationError].push_back(error);
				}
			}
		}
		else
		{
			sections[section] << line;
			if (line.find("//_soltest_line:") == std::string::npos)
				sections[section] << " //" << "soltest_line:" << lineCounter;
			sections[section] << std::endl;
		}
		++lineCounter;
	}
	if (result)
	{
		for (auto &currentSection : sections)
			if (!currentSection.first.empty())
				m_soltests[_filename][currentSection.first] = currentSection.second.str();
		for (auto &currentLine : lines)
			if (!currentLine.first.empty())
				m_soltestsLine[_filename][currentLine.first] = currentLine.second;
	}
	return result;
}

bool Soltest::generateTestcases()
{
	Poco::NotificationQueue queue;
	for (auto &test : m_soltests)
	{
		soltest::Task::Ptr testcasePtr = new soltest::Task(
			[&]()
			{
				soltest::Testcases::Ptr testcasesPtr(new soltest::Testcases(this, test.first, test.second));

				m_testcases_mutex.lock();
				m_testcases[test.first] = testcasesPtr;
				m_testcases_mutex.unlock();
			}
		);
		queue.enqueueNotification(testcasePtr);
	}

	std::vector<soltest::Executor::Ptr> workers;
	for (unsigned int i = 0; i < m_solidityThreads; ++i)
	{
		soltest::Executor::Ptr worker(new Executor(queue));
		workers.push_back(worker);

		m_solidityThreadPool->start(*worker);
	}

	while (!queue.empty())
		Poco::Thread::sleep(100);

	queue.wakeUpAll();
	m_solidityThreadPool->joinAll();

	int errors = 0;
	for (auto &testcase : m_testcases)
		errors += testcase.second->errors().size();

	return errors > 0;
}

void Soltest::runTestcases()
{
	Poco::NotificationQueue queue;
	for (auto &test : m_soltests)
		for (auto &data : test.second)
		{
			soltest::Task::Ptr testcasePtr = new soltest::Task(
				[&]()
				{
					m_testcases_mutex.lock();
					soltest::Testcases::Ptr testcasesPtr(m_testcases[test.first]);
					m_testcases_mutex.unlock();

					testcasesPtr->executeTestcase(data.first);
				}
			);
			queue.enqueueNotification(testcasePtr);
		}

	std::vector<soltest::Executor::Ptr> workers;
	for (unsigned int i = 0; i < m_threads; ++i)
	{
		soltest::Executor::Ptr worker(new Executor(queue));
		workers.push_back(worker);
		m_testcaseThreadPool->start(*worker);
	}

	while (!queue.empty())
		Poco::Thread::sleep(100);

	queue.wakeUpAll();

	m_testcaseThreadPool->joinAll();
}

std::string Soltest::testcaseName(std::string const &_filename, int _line) const
{
	std::string testcaseName;
	if (_line > 0)
	{
		auto iter = m_soltestsLine.find(_filename);
		if (iter != m_soltestsLine.end())
		{
			std::map<std::string, int> testcases = iter->second;
			if (!testcases.empty())
			{
				testcaseName = testcases.begin()->first;
				for (auto &testcase : testcases)
				{
					if (testcase.second > _line)
						break;
					testcaseName = testcase.first;
				}
			}
		}
	}
	return testcaseName;
}

} // namespace soltest
