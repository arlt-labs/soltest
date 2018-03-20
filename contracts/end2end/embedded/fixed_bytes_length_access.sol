/// @ext:soltest
/// {fixed_bytes_length_access}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(bytes32)", "789"), encodeArgs(u256(32), u256(16), u256(8)));
contract C {
	byte a;
	function f(bytes32 x) returns (uint, uint, uint) {
		return (x.length, bytes16(2).length, a.length + 7);
	}
}

