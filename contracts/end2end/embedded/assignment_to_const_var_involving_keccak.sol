/// @ext:soltest
/// {assignment_to_const_var_involving_keccak}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(dev::keccak256("abc")));
contract C {
	bytes32 constant x = keccak256("abc");
	function f() returns (bytes32) { return x; }
}

