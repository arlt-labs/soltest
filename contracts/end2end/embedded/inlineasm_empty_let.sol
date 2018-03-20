/// @ext:soltest
/// {inlineasm_empty_let}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(0), u256(0)));
contract C {
	function f() pure returns (uint a, uint b) {
		assembly {
			let x
			let y, z
			a := x
			b := z
		}
	}
}

