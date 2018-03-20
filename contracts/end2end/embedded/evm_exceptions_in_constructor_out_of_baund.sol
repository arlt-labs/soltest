/// @ext:soltest
/// {evm_exceptions_in_constructor_out_of_baund}
///     // ABI_CHECK(compileAndRunWithoutCheck(sourceCode, 0, "A"), encodeArgs());
contract A {
	uint public test = 1;
	uint[3] arr;
	function A()
	{
		uint index = 5;
		test = arr[index];
		++test;
	}
}

