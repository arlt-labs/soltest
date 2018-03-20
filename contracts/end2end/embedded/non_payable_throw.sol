/// @ext:soltest
/// {non_payable_throw}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunctionWithValue("f()", 27), encodeArgs());
///     // BOOST_CHECK_EQUAL(balanceAt(m_contractAddress), 0);
///     // ABI_CHECK(callContractFunction(""), encodeArgs());
///     // ABI_CHECK(callContractFunction("a()"), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunctionWithValue("", 27), encodeArgs());
///     // BOOST_CHECK_EQUAL(balanceAt(m_contractAddress), 0);
///     // ABI_CHECK(callContractFunction("a()"), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunctionWithValue("a()", 27), encodeArgs());
///     // BOOST_CHECK_EQUAL(balanceAt(m_contractAddress), 0);
contract C {
	uint public a;
	function f() returns (uint) {
		return msg.value;
	}
	function() {
		a = msg.value + 1;
	}
}

