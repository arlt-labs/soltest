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
/** @file State.h
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#ifndef SOLTEST_STATE_H
#define SOLTEST_STATE_H

#include <map>
#include <string>

#include <boost/variant.hpp>

#include <libdevcore/Common.h>

#include "types/Address.h"
#include "types/Contract.h"

namespace soltest
{
namespace interpreter
{

typedef boost::variant<
	bool, /* double, // not  yet implemented in solidity */
	int8_t, int16_t, int32_t, int64_t, dev::s256, // todo: int128_t
	uint8_t, uint16_t, uint32_t, uint64_t, dev::u160, dev::u256, // todo: uint128_t
	std::string,
	Address, Contract
> StateType;

typedef std::vector<StateType> StateTypes;

class State: public std::map<std::string, StateType>, public IExecutable
{
public:
	typedef StateType Type;
	typedef StateTypes Types;

	void setExecutor(IExecutor::Ptr _executor) override
	{
		for (auto& item : *this)
			if (item.second.type() == typeid(Contract))
				boost::get<Contract>(item.second).setExecutor(_executor);
	}
};

} // namespace interpreter
} // namespace soltest

#endif //SOLTEST_STATE_H
