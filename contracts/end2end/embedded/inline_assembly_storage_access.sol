/// @ext:soltest
/// {inline_assembly_storage_access}
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
			sstore(z_slot, 7)
			off1 := z_offset
			off2 := y_offset
		}
		assert(off1 == 0);
		assert(off2 == 2);
		return true;
	}
}

