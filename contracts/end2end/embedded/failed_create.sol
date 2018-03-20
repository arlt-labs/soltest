/// @ext:soltest
/// {failed_create}
///     // compileAndRun(sourceCode, 20, "C");
///     // BOOST_CHECK(callContractFunction("f(uint256)", 20) != encodeArgs(u256(0)));
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunction("f(uint256)", 20), encodeArgs());
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(u256(1)));
///     // ABI_CHECK(callContractFunction("stack(uint256)", 1023), encodeArgs());
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(u256(1)));
contract D { function D() payable {} }
contract C {
	uint public x;
	function C() payable {}
	function f(uint amount) returns (address) {
		x++;
		return (new D).value(amount)();
	}
	function stack(uint depth) returns (address) {
		if (depth < 1024)
			return this.stack(depth - 1);
		else
			return f(0);
	}
}

