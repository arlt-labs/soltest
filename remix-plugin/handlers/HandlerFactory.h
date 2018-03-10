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
/** @file HandlerFactory.h
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#ifndef SOLTEST_HANDLERFACTORY_H
#define SOLTEST_HANDLERFACTORY_H

#include "StaticFileRequestHandler.h"

#include <Poco/Net/HTTPRequestHandlerFactory.h>
#include <Poco/Net/HTTPServerRequest.h>

#include <string>

namespace soltest
{

class HandlerFactory: public Poco::Net::HTTPRequestHandlerFactory
{
public:
	Poco::Net::HTTPRequestHandler* createRequestHandler(const Poco::Net::HTTPServerRequest& request) override
	{
		if (request.getURI() == "/index.html")
			return new StaticFileRequestHandler("/Users/alex/git/soltest/remix-plugin/files/index.html");
		else if (request.getURI() == "/remix.js")
			return new StaticFileRequestHandler("/Users/alex/git/soltest/remix-plugin/files/remix.js");
		else
			return nullptr;
	}

private:
	std::string _format;
};

} // namespace soltest

#endif //SOLTEST_HANDLERFACTORY_H
