/// @ext:soltest
/// {inline_assembly_function_call2}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(1), u256(2), u256(7), u256(0x10)));
contract C {
	function f() {
		assembly {
			let d := 0x10
			function asmfun(a, b, c) -> x, y, z {
				x := a
				y := b
				z := 7
			}
			let a1, b1, c1 := asmfun(1, 2, 3)
			mstore(0x00, a1)
			mstore(0x20, b1)
			mstore(0x40, c1)
			mstore(0x60, d)
			return(0, 0x80)
		}
	}
}

