/// @ext:soltest
/// {inline_assembly_function_call_assignment}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(1), u256(2), u256(7)));
contract C {
	function f() {
		assembly {
			let a1, b1, c1
			function asmfun(a, b, c) -> x, y, z {
				x := a
				y := b
				z := 7
			}
			a1, b1, c1 := asmfun(1, 2, 3)
			mstore(0x00, a1)
			mstore(0x20, b1)
			mstore(0x40, c1)
			return(0, 0x60)
		}
	}
}

