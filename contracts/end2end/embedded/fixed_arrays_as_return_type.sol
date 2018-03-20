/// @ext:soltest
/// {fixed_arrays_as_return_type}
///     // compileAndRun(sourceCode, 0, "B");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(
///     // 	u256(2), u256(3), u256(4), u256(5), u256(6), // first return argument
///     // 	u256(1000), u256(1001), u256(1002), u256(1003), u256(1004)) // second return argument
///     // );
contract A {
	function f(uint16 input) pure returns (uint16[5] arr)
	{
		arr[0] = input;
		arr[1] = ++input;
		arr[2] = ++input;
		arr[3] = ++input;
		arr[4] = ++input;
	}
}
contract B {
	function f() returns (uint16[5] res, uint16[5] res2)
	{
		var a = new A();
		res = a.f(2);
		res2 = a.f(1000);
	}
}

