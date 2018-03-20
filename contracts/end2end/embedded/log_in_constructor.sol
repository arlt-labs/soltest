/// @ext:soltest
/// {log_in_constructor}
///     // compileAndRun(sourceCode);
///     // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
///     // BOOST_CHECK_EQUAL(h256(m_logs[0].data), h256(u256(1)));
///     // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].topics[0], h256(u256(2)));
contract test {
	function test() {
		log1(1, 2);
	}
}

