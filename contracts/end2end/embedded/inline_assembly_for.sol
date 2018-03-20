/// @ext:soltest
/// {inline_assembly_for}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(0)), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(1)), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(2)), encodeArgs(u256(2)));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(3)), encodeArgs(u256(6)));
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(4)), encodeArgs(u256(24)));
contract C {
	function f(uint a) returns (uint b) {
		assembly {
			function fac(n) -> nf {
				nf := 1
				for { let i := n } gt(i, 0) { i := sub(i, 1) } {
					nf := mul(nf, i)
				}
			}
			b := fac(a)
		}
	}
}

