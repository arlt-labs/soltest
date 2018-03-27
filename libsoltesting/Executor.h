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
/** @file Worker.h
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#ifndef SOLTEST_WORKER_H
#define SOLTEST_WORKER_H

#include "Task.h"

#include <Poco/Runnable.h>
#include <Poco/NotificationQueue.h>

#include <functional>
#include <utility>

namespace soltest
{

class Executor : public Poco::Runnable
{
public:
	typedef typename std::shared_ptr<Executor> Ptr;

	explicit Executor(Poco::NotificationQueue &queue) : m_queue(queue) {}

	void run() override
	{
		while (!m_queue.empty())
		{
			Poco::AutoPtr<Poco::Notification> pNf(m_queue.waitDequeueNotification(100));
			while (pNf)
			{
				auto pWorkNf = dynamic_cast<Task *>(pNf.get());
				if (pWorkNf)
					pWorkNf->run();
				pNf = m_queue.waitDequeueNotification(100);
			}
		}
	}

private:
	Poco::NotificationQueue &m_queue;
};

} // namespace soltest

#endif //SOLTEST_WORKER_H
