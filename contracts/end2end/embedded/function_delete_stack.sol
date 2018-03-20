/// @ext:soltest
/// {function_delete_stack}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs());
contract C {
	function a() returns (uint) { return 7; }
	function test() returns (uint) {
		var y = a;
		delete y;
		y();
	}
}

