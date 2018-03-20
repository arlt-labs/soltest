/// @ext:soltest
/// {log2}
///     // compileAndRun(sourceCode);
///     // callContractFunction("a()");
///     // BOOST_REQUIRE_EQUAL(m_logs.size(), 1);
///     // BOOST_CHECK_EQUAL(m_logs[0].address, m_contractAddress);
///     // BOOST_CHECK_EQUAL(h256(m_logs[0].data), h256(u256(1)));
///     // BOOST_REQUIRE_EQUAL(m_logs[0].topics.size(), 2);
///     // for (unsigned i = 0; i < 2; ++i)
///     // 	BOOST_CHECK_EQUAL(m_logs[0].topics[i], h256(u256(i + 2)));
contract test {
	function a() {
		log2(1, 2, 3);
	}
}

