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
/** @file main.cpp
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#include "handlers/HandlerFactory.h"

#include <Poco/Util/ServerApplication.h>
#include <Poco/Util/HelpFormatter.h>
#include <Poco/Task.h>
#include <Poco/TaskManager.h>
#include <Poco/DateTimeFormatter.h>

#include <Poco/Net/HTTPServer.h>
#include <Poco/Net/HTTPServerParams.h>
#include <Poco/ThreadPool.h>

#include <iostream>

using Poco::Util::Application;
using Poco::Util::ServerApplication;
using Poco::Util::Option;
using Poco::Util::OptionSet;
using Poco::Util::OptionCallback;
using Poco::Util::HelpFormatter;

namespace soltest
{

class RemixPlugin : public ServerApplication
{
public:
	RemixPlugin() : _helpRequested(false)
	{
	}

	~RemixPlugin()
	{
	}

protected:
	void initialize(Application &self) override
	{
		loadConfiguration(); // load default configuration files, if present
		ServerApplication::initialize(self);
		logger().information("starting up");
	}

	void uninitialize() override
	{
		logger().information("shutting down");
		ServerApplication::uninitialize();
	}

	void defineOptions(OptionSet &options) override
	{
		ServerApplication::defineOptions(options);

		options.addOption(
			Option("help", "h", "display help information on command line arguments")
				.required(false)
				.repeatable(false)
				.callback(OptionCallback<RemixPlugin>(this, &RemixPlugin::handleHelp)));
	}

	void handleHelp(const std::string &name, const std::string &value)
	{
		(void) name;
		(void) value;
		_helpRequested = true;
		displayHelp();
		stopOptionsProcessing();
	}

	void displayHelp()
	{
		HelpFormatter helpFormatter(options());
		helpFormatter.setCommand(commandName());
		helpFormatter.setUsage("OPTIONS");
		helpFormatter.setHeader(
			"soltest remix-plugin.");
		helpFormatter.format(std::cout);
	}

	int main(const std::vector < std::string > & args) override
	{
		(void) args;
		if (!_helpRequested)
		{
			// get parameters from configuration file
			unsigned short port = (unsigned short) config().getInt("HTTPTimeServer.port", 8081);
			int maxQueued = config().getInt("HTTPTimeServer.maxQueued", 100);
			int maxThreads = config().getInt("HTTPTimeServer.maxThreads", 16);
			Poco::ThreadPool::defaultPool().addCapacity(maxThreads);

			auto pParams = new Poco::Net::HTTPServerParams;
			pParams->setMaxQueued(maxQueued);
			pParams->setMaxThreads(maxThreads);

			// set-up a server socket
			Poco::Net::ServerSocket svs(port);
			// set-up a HTTPServer instance
			Poco::Net::HTTPServer srv(new soltest::HandlerFactory(), svs, pParams);
			// start the HTTPServer
			srv.start();

			waitForTerminationRequest();

			srv.stop();
		}
		return Application::EXIT_OK;
	}

private:
	bool _helpRequested;
};

} // namespace soltest


POCO_SERVER_MAIN(soltest::RemixPlugin)
