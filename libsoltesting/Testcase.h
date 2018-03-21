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
#include <atomic>

#include <Poco/Thread.h>

namespace soltest
{

class Testcase : public Poco::Notification
{
public:
	typedef typename Poco::AutoPtr<Testcase> Ptr;

	enum class State
	{
		READY,
		RUNNING,
		FINISHED
	};
	explicit Testcase(std::function<void(void)> _run) : m_run(_run), m_state(State::READY)
	{
	}

	void run()
	{
		m_state = State::RUNNING;
		m_run();
		m_state = State::FINISHED;
	}

	void wait() const
	{
		while (m_state == State::RUNNING)
			Poco::Thread::sleep(250);
	}

private:
	std::function<void(void)> m_run;
	std::atomic<State> m_state;
};

} // namespace soltest

#endif //SOLTEST_WORKITEM_H
