/// @ext:soltest
/// {multiple_return_values}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("run(bool,uint256)", true, 0xcd), encodeArgs(0xcd, true, 0));
contract test {
	function run(bool x1, uint x2) returns(uint y1, bool y2, uint y3) {
		y1 = x2; y2 = x1;
	}
}

