/// @ext:soltest
/// {lone_struct_array_type}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(3)));
contract C {
	struct s { uint a; uint b;}
	function f() returns (uint) {
		s[7][]; // This is only the type, should not have any effect
		return 3;
	}
}

