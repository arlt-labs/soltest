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
/** @file StaticFileRequestHandler.h
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#ifndef SOLTEST_STATICFILEREQUESTHANDLER_H
#define SOLTEST_STATICFILEREQUESTHANDLER_H

#include <Poco/Net/HTTPRequestHandler.h>
#include <boost/filesystem.hpp>

namespace soltest
{

class StaticFileRequestHandler : public Poco::Net::HTTPRequestHandler
{
public:
	explicit StaticFileRequestHandler(std::string const& _file) : m_file(_file) {
	}
	void handleRequest(Poco::Net::HTTPServerRequest &request, Poco::Net::HTTPServerResponse &response) override;

private:
	std::string m_file;
};

} // namespace soltest

#endif //SOLTEST_STATICFILEREQUESTHANDLER_H
