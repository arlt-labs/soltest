/// @ext:soltest
/// {multi_modifiers}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f1()"), bytes());
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(u256(8)));
///     // ABI_CHECK(callContractFunction("f2()"), bytes());
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(u256(12)));
contract C {
	uint public x;
	modifier m1 {
		address a1 = msg.sender;
		x++;
		_;
	}
	function f1() m1() {
		x += 7;
	}
	function f2() m1() {
		x += 3;
	}
}

