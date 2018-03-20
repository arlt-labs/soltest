/// @ext:soltest
/// {fixed_bytes_index_access}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(bytes32)", "789"), encodeArgs("9"));
///     // ABI_CHECK(callContractFunction("g(bytes32)", "789"), encodeArgs(u256(int('5'))));
///     // ABI_CHECK(callContractFunction("data(uint256)", u256(1)), encodeArgs("8"));
contract C {
	bytes16[] public data;
	function f(bytes32 x) returns (byte) {
		return x[2];
	}
	function g(bytes32 x) returns (uint) {
		data = [x[0], x[1], x[2]];
		data[0] = "12345";
		return uint(data[0][4]);
	}
}

