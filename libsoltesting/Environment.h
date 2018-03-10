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
/** @file Environment.h
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#ifndef SOLTEST_ENVIRONMENT_H
#define SOLTEST_ENVIRONMENT_H

#include <libsolidity/interface/CompilerStack.h>

namespace soltest
{

class Environment
{
public:
	void load(dev::solidity::CompilerStack& _compilerStack);
	void reset();

	std::string contracts();
};

} // namespace soltest

#endif //SOLTEST_ENVIRONMENT_H
