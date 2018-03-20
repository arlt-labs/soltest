/// @ext:soltest
/// {event_anonymous}
///     // compileAndRun(sourceCode);
///     // callContractFunction("deposit()");
///     // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 0);
contract ClientReceipt {
	event Deposit() anonymous;
	function deposit() {
		Deposit();
	}
}

