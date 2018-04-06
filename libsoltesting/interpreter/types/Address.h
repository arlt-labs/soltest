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
/** @file Address.h
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#ifndef SOLTEST_ADDRESS_H
#define SOLTEST_ADDRESS_H

#include <boost/variant.hpp>

#include <libdevcore/Common.h>

namespace soltest
{
namespace interpreter
{

// forward declaration fun :D
class Contract;

class Address;

using StateType =  boost::variant<
	bool, /* double, // not  yet implemented in solidity */
	int8_t, int16_t, int32_t, int64_t, dev::s256, // todo: int128_t
	uint8_t, uint16_t, uint32_t, uint64_t, dev::u160, dev::u256, // todo: uint128_t
	std::string,
	Address, Contract
>;

using StateTypes = std::vector<StateType>;

class Address
{

};

} // namespace interpreter
} // namespace soltest

#endif //SOLTEST_ADDRESS_H
