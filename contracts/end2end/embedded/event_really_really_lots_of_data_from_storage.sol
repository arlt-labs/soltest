/// @ext:soltest
/// {event_really_really_lots_of_data_from_storage}
///     // compileAndRun(sourceCode);
///     // callContractFunction("deposit()");
///     // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
///     // BOOST_CHECK(m_logs[0].data == encodeArgs(10, 0x60, 15, 31, string("ABC") + string(27, 0) + "Z"));
///     // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[0], dev::keccak256(string("Deposit(uint256,bytes,uint256)")));
contract ClientReceipt {
	bytes x;
	event Deposit(uint fixeda, bytes dynx, uint fixedb);
	function deposit() {
		x.length = 31;
		x[0] = "A";
		x[1] = "B";
		x[2] = "C";
		x[30] = "Z";
		Deposit(10, x, 15);
	}
}

