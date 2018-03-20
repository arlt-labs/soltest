/// @ext:soltest
/// {delete_on_array_of_structs}
///     // compileAndRun(sourceCode, 0, "C");
///     // // This code interprets x as an array length and thus will go out of gas.
///     // // neither of the two should throw due to out-of-bounds access
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(true));
///     //
contract C {
	struct S { uint x; uint[] y; }
	S[] data;
	function f() returns (bool) {
		data.length = 2;
		data[0].x = 2**200;
		data[1].x = 2**200;
		delete data;
		return true;
	}
}

