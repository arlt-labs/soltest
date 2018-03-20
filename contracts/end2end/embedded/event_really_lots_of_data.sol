/// @ext:soltest
/// {event_really_lots_of_data}
///     // compileAndRun(sourceCode);
///     // callContractFunction("deposit()");
///     // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
///     // BOOST_CHECK_EQUAL(toHex(m_logs[0].data), toHex(encodeArgs(10, 0x60, 15, 4) + FixedHash<4>(dev::keccak256("deposit()")).asBytes()));
///     // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[0], dev::keccak256(string("Deposit(uint256,bytes,uint256)")));
contract ClientReceipt {
	event Deposit(uint fixeda, bytes dynx, uint fixedb);
	function deposit() {
		Deposit(10, msg.data, 15);
	}
}

