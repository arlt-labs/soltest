/// @ext:soltest
/// {inline_assembly_storage_access_inside_function}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("z()"), encodeArgs(u256(7)));
contract C {
	uint16 x;
	uint16 public y;
	uint public z;
	function f() returns (bool) {
		uint off1;
		uint off2;
		assembly {
			function f() -> o1 {
				sstore(z_slot, 7)
				o1 := y_offset
			}
			off2 := f()
		}
		assert(off2 == 2);
		return true;
	}
}

