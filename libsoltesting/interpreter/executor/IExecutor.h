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
/** @file IExecutor.h
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#ifndef SOLTEST_IEXECUTOR_H
#define SOLTEST_IEXECUTOR_H

namespace soltest
{
namespace interpreter
{

class IExecutor
{
public:
	typedef typename std::shared_ptr<IExecutor> Ptr;
};

class IExecutable
{
public:
	virtual void setExecutor(IExecutor::Ptr _executor) = 0;
};

class Executable : public IExecutable
{
public:
	void setExecutor(IExecutor::Ptr _executor) override
	{
		m_executor = _executor;
	}

protected:
	IExecutor::Ptr m_executor{};
};

} // namespace interpreter
} // namespace soltest

#endif //SOLTEST_IEXECUTOR_H
