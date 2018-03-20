/// @ext:soltest
/// {swap_in_storage_overwrite}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(u256(0), u256(0)));
///     // ABI_CHECK(callContractFunction("y()"), encodeArgs(u256(0), u256(0)));
///     // ABI_CHECK(callContractFunction("set()"), encodeArgs());
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(u256(1), u256(2)));
///     // ABI_CHECK(callContractFunction("y()"), encodeArgs(u256(3), u256(4)));
///     // ABI_CHECK(callContractFunction("swap()"), encodeArgs());
///     // ABI_CHECK(callContractFunction("x()"), encodeArgs(u256(1), u256(2)));
///     // ABI_CHECK(callContractFunction("y()"), encodeArgs(u256(1), u256(2)));
contract c {
	struct S { uint a; uint b; }
	S public x;
	S public y;
	function set() {
		x.a = 1; x.b = 2;
		y.a = 3; y.b = 4;
	}
	function swap() {
		(x, y) = (y, x);
	}
}

