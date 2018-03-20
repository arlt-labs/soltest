/// @ext:soltest
/// {msg_sig}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("foo(uint256)", 0), encodeArgs(asString(FixedHash<4>(dev::keccak256("foo(uint256)")).asBytes())));
contract test {
	function foo(uint256 a) returns (bytes4 value) {
		return msg.sig;
	}
}

