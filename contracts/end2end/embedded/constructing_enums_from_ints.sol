	/// @ext:soltest
/// {constructing_enums_from_ints}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(1));
contract c {
		enum Truth { False, True }
		function test() returns (uint)
		{
			return uint(Truth(uint8(0x701)));
		}
	}

