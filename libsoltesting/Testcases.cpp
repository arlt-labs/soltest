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
#include "Testcases.h"

namespace soltest
{

Testcases::Testcases(std::string const &_filename, std::map<std::string, std::string> &_testcases)
{
	(void) _filename;
	(void) _testcases;
}

void Testcases::executeTestcase(std::string const &_testcase)
{
	(void) _testcase;
}

} // namespace soltest