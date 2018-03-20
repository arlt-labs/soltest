/// @ext:soltest
/// {inline_assembly_function_access}
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction("f(uint256)", u256(5)), encodeArgs());
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(u256(10)));
contract C {
	uint public x;
	function g(uint y) { x = 2 * y; assembly { stop } }
	function f(uint _x) {
		assembly {
			_x
			jump(g)
			pop
		}
	}
}

