/// @ext:soltest
/// {msg_sig_after_internal_call_is_same}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("foo(uint256)", 0), encodeArgs(asString(FixedHash<4>(dev::keccak256("foo(uint256)")).asBytes())));
contract test {
	function boo() returns (bytes4 value) {
		return msg.sig;
	}
	function foo(uint256 a) returns (bytes4 value) {
		return boo();
	}
}

