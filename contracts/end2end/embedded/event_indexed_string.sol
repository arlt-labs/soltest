/// @ext:soltest
/// {event_indexed_string}
///     // compileAndRun(sourceCode);
///     // callContractFunction("deposit()");
///     // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
///     // string dynx(90, 0);
///     // for (size_t i = 0; i < dynx.size(); ++i)
///     // 	dynx[i] = i;
///     // BOOST_CHECK(m_logs[0].data == bytes());
///     // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 3);
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[1], dev::keccak256(dynx));
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[2], dev::keccak256(
///     // 	encodeArgs(u256(4), u256(5), u256(6), u256(7))
///     // ));
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[0], dev::keccak256(string("E(string,uint256[4])")));
contract C {
	string x;
	uint[4] y;
	event E(string indexed r, uint[4] indexed t);
	function deposit() {
		bytes(x).length = 90;
		for (uint i = 0; i < 90; i++)
			bytes(x)[i] = byte(i);
		y[0] = 4;
		y[1] = 5;
		y[2] = 6;
		y[3] = 7;
		E(x, y);
	}
}

