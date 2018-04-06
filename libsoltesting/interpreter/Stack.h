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
/** @file Stack.h
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#ifndef SOLTEST_STACK_H
#define SOLTEST_STACK_H

#include <vector>

#include <boost/variant.hpp>

#include <libsolidity/parsing/Token.h>

#include "State.h"

namespace soltest
{
namespace interpreter
{

struct EmptyType
{
};

struct Identifier
{
	std::string name;
	std::string type;
};

struct Literal
{
	explicit Literal(dev::solidity::Token::Value& _value) : value(_value)
	{}

	dev::solidity::Token::Value value;
};

typedef boost::variant<
	EmptyType,
	Literal, Identifier,
	StateType
> StackType;

class Stack: public std::vector<StackType>
{
public:
	typedef StackType Type;

	Type first()
	{
		if (!this->empty())
			return *this->rbegin();
		else
			return Type(EmptyType());
	}

	Type pop()
	{
		if (!this->empty())
		{
			Type result = this->back();
			this->pop_back();
			// print();
			return result;
		}
		else
			return Type(EmptyType());
	}

	static std::string TypeAsString(Type& type)
	{
		std::stringstream result;
		if (type.type() == typeid(EmptyType))
			result << "EmptyType";
		else if (type.type() == typeid(Literal))
			result << "Literal";
		else if (type.type() == typeid(Identifier))
			result << "Identifier";
		return result.str();
	}

	static std::string ValueAsString(Type& type)
	{
		std::stringstream result;
		if (type.type() == typeid(EmptyType))
			result << "-";
		else if (type.type() == typeid(Literal))
		{
			Literal literal = boost::get<Literal>(type);
			if (literal.value == dev::solidity::Token::FalseLiteral)
				result << "False";
			else if (literal.value == dev::solidity::Token::TrueLiteral)
				result << "True";
			else
				result << "'" << literal.value << "'";
		}
		else if (type.type() == typeid(Identifier))
			result << "name = '" << boost::get<Identifier>(type).name << "' type = '"
				   << boost::get<Identifier>(type).type << "'";
		return result.str();
	}

	void print(std::ostream& stream = std::cout)
	{
		stream << std::endl;
		stream << " --- stack ---" << std::endl;
		int count = 0;
		for (auto iter = this->rbegin(); iter != this->rend(); ++iter)
		{
			if (count == 0)
				stream << "  * ";
			else
				stream << "    ";
			stream << count << ": ";
			stream << TypeAsString(*iter) << ": " << ValueAsString(*iter);
			stream << std::endl;
			++count;
		}
		if (this->empty())
		{
			stream << "   { empty }" << std::endl;
		}
		stream << " -------------" << std::endl;
	}
};

} // namespace interpreter
} // namespace soltest

#endif //SOLTEST_STACK_H
