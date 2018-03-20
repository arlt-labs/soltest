/// @ext:soltest
/// {no_nonpayable_circumvention_by_modifier}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunctionWithValue("f()", 27), encodeArgs());
///     // BOOST_CHECK_EQUAL(balanceAt(m_contractAddress), 0);
contract C {
	modifier tryCircumvent {
		if (false) _; // avoid the function, we should still not accept ether
	}
	function f() tryCircumvent returns (uint) {
		return msg.value;
	}
}

