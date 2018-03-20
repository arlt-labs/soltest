/// @ext:soltest
/// {log0}
///     // compileAndRun(sourceCode);
///     // callContractFunction("a()");
///     // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
///     // BOOST_CHECK_EQUAL(h256(m_logs[0].data), h256(u256(1)));
///     // BOOST_CHECK_EQUAL(m_logs[0].topics.size(), 0);
contract test {
	function a() {
		log0(1);
	}
}

