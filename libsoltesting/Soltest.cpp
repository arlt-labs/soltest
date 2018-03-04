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

#include <boost/test/unit_test.hpp>
#include <boost/filesystem.hpp>

#include <boost/algorithm/string.hpp>

namespace soltest
{

Soltest::Soltest()
{
	m_scannerFromSourceName =
		[&](std::string const &_sourceName) -> dev::solidity::Scanner const &
		{
			return m_compilerStack.scanner(_sourceName);
		};
}

bool Soltest::parseCommandLineArgumentss(int argc, char **argv)
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
		else if (boost::starts_with(argument, "-"))
			m_options[argument] = "yes";
		else if (boost::filesystem::exists(absolutePath))
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
	preloadContracts();
	searchSoltestFiles();
	return !m_solidityFiles.empty();
}

void Soltest::preloadContracts()
{
	dev::solidity::CompilerStack compilerStack;
	for (auto &contract : m_solidityFiles)
	{
		std::ifstream file(contract);
		std::stringstream content;
		content << file.rdbuf();

		compilerStack.addSource(contract, content.str());
		compilerStack.parseAndAnalyze();
	}
	for (auto &contract : compilerStack.contractNames())
		m_contracts.insert(contract);
}

void Soltest::searchSoltestFiles()
{
	for (auto &solidityFile : m_solidityFiles)
	{
		std::string soltestFile = boost::filesystem::path(solidityFile).string() + "test";
		if (boost::filesystem::exists(soltestFile))
			addSoltestFile(soltestFile);
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
				addSoltestFile(soltestFile);
		}
	}
}

bool Soltest::addSolidityFile(std::string const &solidityFile)
{
	if (boost::filesystem::exists(solidityFile))
	{
		m_solidityFiles.insert(solidityFile);
		return true;
	}
	return false;
}

bool Soltest::addSoltestFile(std::string const &soltestFile)
{
	if (boost::filesystem::exists(soltestFile))
	{
		m_soltestFiles.insert(soltestFile);
		return true;
	}
	return false;
}

bool Soltest::loadContracts()
{
	m_compilerStack.reset();
	dev::solidity::ErrorList errors;
	for (auto &contract : m_solidityFiles)
	{
		std::ifstream file(contract);
		std::stringstream content;
		content << file.rdbuf();

		m_compilerStack.addSource(contract, content.str());
		m_compilerStack.parseAndAnalyze();
		for (auto const &error: m_compilerStack.errors())
		{
			m_compilerErrors[contract][error->type()].push_back(error);
			if (error->type() != dev::solidity::Error::Type::Warning)
				errors.push_back(error);
		}
	}
	return errors.empty();
}

bool Soltest::loadTestcases()
{
	m_soltests.clear();
	m_soltestsLine.clear();

	bool success = true;
	for (auto &soltest : m_soltestFiles)
	{
		std::ifstream file(soltest);
		std::string section;
		uint32_t lineCounter(1);
		std::map<std::string, uint32_t> lines;
		std::map<std::string, std::stringstream> sections;
		for (std::string line; getline(file, line);)
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
						success = false;
						Error::Ptr error = std::make_shared<Error>();
						error->file = soltest;
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
		for (auto &currentSection : sections)
			m_soltests[soltest][currentSection.first] = currentSection.second.str();
		for (auto &currentLine : lines)
			m_soltestsLine[soltest][currentLine.first] = currentLine.second;
	}
	return success;
}

} // namespace soltest
