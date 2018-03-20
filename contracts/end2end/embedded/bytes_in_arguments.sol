/// @ext:soltest
/// {bytes_in_arguments}
///     // compileAndRun(sourceCode);
///     //
///     // string innercalldata1 = asString(FixedHash<4>(dev::keccak256("f(uint256,uint256)")).asBytes() + encodeArgs(8, 9));
///     // string innercalldata2 = asString(FixedHash<4>(dev::keccak256("g(uint256)")).asBytes() + encodeArgs(3));
///     // bytes calldata = encodeArgs(
///     // 	12, 32 * 4, u256(32 * 4 + 32 + (innercalldata1.length() + 31) / 32 * 32), 13,
///     // 	u256(innercalldata1.length()), innercalldata1,
///     // 	u256(innercalldata2.length()), innercalldata2);
///     // ABI_CHECK(
///     // 	callContractFunction("test(uint256,bytes,bytes,uint256)", calldata),
///     // 	encodeArgs(12, (8 + 9) * 3, 13, u256(innercalldata1.length()))
///     // );
contract c {
	uint result;
	function f(uint a, uint b) { result += a + b; }
	function g(uint a) { result *= a; }
	function test(uint a, bytes data1, bytes data2, uint b) external returns (uint r_a, uint r, uint r_b, uint l) {
		r_a = a;
		this.call(data1);
		this.call(data2);
		r = result;
		r_b = b;
		l = data1.length;
	}
}

