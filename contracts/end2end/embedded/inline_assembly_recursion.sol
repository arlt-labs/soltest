/// @ext:soltest
/// {inline_assembly_recursion}
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
				switch n
				case 0 { nf := 1 }
				case 1 { nf := 1 }
				default { nf := mul(n, fac(sub(n, 1))) }
			}
			b := fac(a)
		}
	}
}

