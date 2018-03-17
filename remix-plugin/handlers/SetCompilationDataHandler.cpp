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
/** @file SetCompilationDataHandler.h
 * @author Alexander Arlt <alexander.arlt@arlt-labs.com>
 * @date 2018
 */

#include <iostream>
#include "SetCompilationDataHandler.h"

#include <Poco/Net/HTTPServerRequest.h>
#include <Poco/Net/HTTPServerResponse.h>

#include <libdevcore/JSON.h>

#include <libsoltesting/Soltest.h>
#include <libsolidity/interface/SourceReferenceFormatter.h>
#include <boost/algorithm/string.hpp>

namespace soltest
{

void SetCompilationDataHandler::handleRequest(Poco::Net::HTTPServerRequest &request,
											  Poco::Net::HTTPServerResponse &response)
{
	soltest::Soltest soltest;
	soltest::Environment environment;
	std::streamsize len = request.getContentLength();
	auto buffer = new char[len];
	request.stream().read(buffer, len);

	Json::Value bodyRaw;
	dev::jsonParse(std::string(buffer), bodyRaw);

	Json::Value body;
	dev::jsonParse(bodyRaw["data"].asString(), body);

	for (auto &filename : body["value"]["source"]["sources"].getMemberNames())
	{
		std::cout << filename << std::endl;
		if (filename == "browser/Soltest.sol")
		{
			soltest.addSolidityFile(filename, environment.contracts());
		}
		else
		{
			std::string content(body["value"]["source"]["sources"][filename]["content"].asString());
			soltest.addSolidityFile(filename, content);
		}
	}

	soltest.initialize();
	bool loadContractsResult(soltest.loadContracts());
	bool loadTestcasesResult(soltest.loadTestcases());

	std::set<std::string> warningSet;
	std::set<std::string> errorSet;
	std::stringstream stream;

	std::cout << "loading contracts returned " << loadContractsResult << std::endl;
	std::cout << "loading testcases returned " << loadTestcasesResult << std::endl;

	for (auto &errors : soltest.compilerErrors())
		if (errors.first == dev::solidity::Error::Type::Warning)
			for (auto &em : errors.second)
			{
				auto const &err = dynamic_cast<dev::solidity::Error const &>(*em);
				std::string
					formattedMessage = dev::solidity::SourceReferenceFormatter::formatExceptionInformation(
					*em, err.typeName(), soltest.scannerFromSourceName()
				);
				boost::replace_all(formattedMessage, "\n", "\n    ");
				warningSet.insert(formattedMessage);
			}
	stream.str("");
	stream << "\n    ";
	for (auto &warning : warningSet)
		stream << warning;
	std::cout << stream.str() << std::endl;

	for (auto &errors : soltest.compilerErrors())
		if (errors.first != dev::solidity::Error::Type::Warning)
			for (auto &em : errors.second)
			{
				auto const &err = dynamic_cast<dev::solidity::Error const &>(*em);
				std::string
					formattedMessage = dev::solidity::SourceReferenceFormatter::formatExceptionInformation(
					*em, err.typeName(), soltest.scannerFromSourceName()
				);
				boost::replace_all(formattedMessage, "\n", "\n    ");
				errorSet.insert(formattedMessage);
			}
	stream.str("");
	stream << "\n    ";
	for (auto &error: errorSet)
		stream << error;
	std::cout << stream.str() << std::endl;

	for (auto const &soltestFile: soltest.soltests())
		for (auto const &testcase: soltestFile.second)
		{
			std::cout << soltestFile.first << " - " << testcase.first << std::endl;
			std::cout << "\t- " << testcase.second << std::endl;
		}

	std::ostream &ostr = response.send();
	ostr << "{\"\": \"HELLO FROM SERVER!\"}";

}

} // namespace soltest
