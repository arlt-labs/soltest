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

#include <string>
#include <set>
#include <map>

namespace soltest
{

class Soltest
{
public:
	Soltest();

	bool parseCommandLineArgumentss(int argc, char **argv);

	bool addSolidityFile(std::string const& solidityFile);
	bool addSoltestFile(std::string const& soltestFile);

	void searchSoltestFiles();

private:
	std::map<std::string, std::string> m_options;

	std::string m_ipcpath;
	std::set<std::string> m_solidityFiles;
	std::set<std::string> m_soltestFiles;
};

} // namespace soltest

#endif //SOLTEST_SOLTEST_H
