/// @ext:soltest
/// {inline_assembly_jumps}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()", u256(5)), encodeArgs(u256(13)));
///     // ABI_CHECK(callContractFunction("f()", u256(7)), encodeArgs(u256(34)));
contract C {
	function f() {
		assembly {
			let n := calldataload(4)
			let a := 1
			let b := a
		loop:
			jumpi(loopend, eq(n, 0))
			a add swap1
			n := sub(n, 1)
			jump(loop)
		loopend:
			mstore(0, a)
			return(0, 0x20)
		}
	}
}

