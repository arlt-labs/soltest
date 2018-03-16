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
	along with solidity.  If not, see <http://www.gnu.org/licenses/>.
*/
/** @file WorkItem.h
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#ifndef SOLTEST_WORKITEM_H
#define SOLTEST_WORKITEM_H

#include <Poco/Notification.h>
#include <functional>
#include <utility>
#include "Soltest.h"

namespace soltest
{

class WorkItem : public Poco::Notification
{
public:
	explicit WorkItem(std::function<void(void)> _run) : m_run(_run)
	{
	}

	void run()
	{
		m_run();
	}

private:
	std::function<void(void)> m_run;
};

} // namespace soltest

#endif //SOLTEST_WORKITEM_H
