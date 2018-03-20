/// @ext:soltest
/// {evm_exceptions_in_constructor_call_fail}
///     // compileAndRun(sourceCode, 0, "B");
///     //
///     // ABI_CHECK(callContractFunction("testIt()"), encodeArgs());
///     // ABI_CHECK(callContractFunction("test()"), encodeArgs(2));
contract A {
	function A()
	{
		this.call("123");
	}
}
contract B {
	uint public test = 1;
	function testIt()
	{
		A a = new A();
		++test;
	}
}

