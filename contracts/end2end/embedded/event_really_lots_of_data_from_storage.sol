/// @ext:soltest
/// {event_really_lots_of_data_from_storage}
///     // compileAndRun(sourceCode);
///     // callContractFunction("deposit()");
///     // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
///     // BOOST_CHECK_EQUAL(toHex(m_logs[0].data), toHex(encodeArgs(10, 0x60, 15, 3, string("ABC"))));
///     // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[0], dev::keccak256(string("Deposit(uint256,bytes,uint256)")));
contract ClientReceipt {
	bytes x;
	event Deposit(uint fixeda, bytes dynx, uint fixedb);
	function deposit() {
		x.length = 3;
		x[0] = "A";
		x[1] = "B";
		x[2] = "C";
		Deposit(10, x, 15);
	}
}

