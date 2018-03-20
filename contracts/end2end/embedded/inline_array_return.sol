/// @ext:soltest
/// {inline_array_return}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(1, 2, 3, 4, 5));
contract C {
	uint8[] tester; 
	function f() returns (uint8[5]) {
		return ([1,2,3,4,5]);
	}
	function test() returns (uint8, uint8, uint8, uint8, uint8) {
		tester = f(); 
		return (tester[0], tester[1], tester[2], tester[3], tester[4]);
	}
	
}

