/// @ext:soltest
/// {payable_function}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunctionWithValue("f()", 27), encodeArgs(u256(27)));
///     // BOOST_CHECK_EQUAL(balanceAt(m_contractAddress), 27);
///     // ABI_CHECK(callContractFunctionWithValue("", 27), encodeArgs());
///     // BOOST_CHECK_EQUAL(balanceAt(m_contractAddress), 27 + 27);
///     // ABI_CHECK(callContractFunction("a()"), encodeArgs(u256(28)));
///     // BOOST_CHECK_EQUAL(balanceAt(m_contractAddress), 27 + 27);
contract C {
	uint public a;
	function f() payable returns (uint) {
		return msg.value;
	}
	function() payable {
		a = msg.value + 1;
	}
}

