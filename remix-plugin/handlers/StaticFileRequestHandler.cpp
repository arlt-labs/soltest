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
/** @file StaticFileRequestHandler.cpp
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#include "StaticFileRequestHandler.h"

#include <Poco/Net/HTTPServerRequest.h>
#include <Poco/Net/HTTPServerResponse.h>

#include <fstream>
#include <sstream>

namespace soltest
{

void StaticFileRequestHandler::handleRequest(Poco::Net::HTTPServerRequest& request,
											 Poco::Net::HTTPServerResponse& response)
{
	(void) request;

	response.setChunkedTransferEncoding(true);
	response.setContentType("text/html");

	std::ostream& ostr = response.send();
	if (boost::filesystem::exists(m_file))
	{
		std::ifstream file(m_file);
		std::stringstream content;
		ostr << file.rdbuf();
	}
	else
		ostr << "error: file '" << m_file << "' was not found!";
}

} // namespace soltest