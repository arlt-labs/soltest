library L {
	struct S { uint[] data; }
	function f(S _s) internal returns (uint[]) {
		_s.data[3] = 2;
		return _s.data;
	}
}
/// @ext:soltest
/// {internal_library_function_return_var_size}
///     // // This has to work without linking, because everything will be inlined.
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(2)));
contract C {
	using L for L.S;
	function f() returns (uint) {
		L.S memory x;
		x.data = new uint[](7);
		x.data[3] = 8;
		return x.f()[3];
	}
}

