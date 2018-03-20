library L {
	function g(uint[] _data) private {
		_data[3] = 2;
	}
	function f(uint[] _data) internal {
		g(_data);
	}
}
/// @ext:soltest
/// {internal_library_function_calling_private}
///     // // This has to work without linking, because everything will be inlined.
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(2)));
contract C {
	function f() returns (uint) {
		uint[] memory x = new uint[](7);
		x[3] = 8;
		L.f(x);
		return x[3];
	}
}

