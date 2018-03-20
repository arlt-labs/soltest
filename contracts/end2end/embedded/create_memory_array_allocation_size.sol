/// @ext:soltest
/// {create_memory_array_allocation_size}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(0x40, 0x40, 0x20 + 256));
contract C {
	function f() pure returns (uint d1, uint d2, uint d3) {
		bytes memory b1 = new bytes(31);
		bytes memory b2 = new bytes(32);
		bytes memory b3 = new bytes(256);
		bytes memory b4 = new bytes(31);
		assembly {
			d1 := sub(b2, b1)
			d2 := sub(b3, b2)
			d3 := sub(b4, b3)
		}
	}
}

