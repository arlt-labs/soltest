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
			++i;
		}
		else if (boost::starts_with(argument, "-"))
			m_options[argument] = "yes";
		else if (boost::filesystem::exists(absolutePath))
			if (boost::filesystem::extension(absolutePath) == ".sol")
				this->addSolidityFile(absolutePath);
			else if (boost::filesystem::extension(absolutePath) == ".soltest")
			{
				std::string contractFile(absolutePath.substr(0, absolutePath.length() - 4));
				if (boost::filesystem::exists(contractFile))
					this->addSolidityFile(contractFile);
			}
	}

	this->searchSoltestFiles();

	return false;
}

void Soltest::searchSoltestFiles()
{
	for (auto &solidityFile : this->m_solidityFiles)
	{
		std::string soltestFile = boost::filesystem::path(solidityFile).string() + "test";
		if (boost::filesystem::exists(soltestFile))
			this->addSoltestFile(soltestFile);
	}
}

bool Soltest::addSolidityFile(std::string const &solidityFile)
{
	if (boost::filesystem::exists(solidityFile))
	{
		this->m_solidityFiles.insert(solidityFile);
		return true;
	}
	return false;
}

bool Soltest::addSoltestFile(std::string const &soltestFile)
{
	if (boost::filesystem::exists(soltestFile))
	{
		this->m_soltestFiles.insert(soltestFile);
		return true;
	}
	return false;
}

} // namespace soltest
