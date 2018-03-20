/// @ext:soltest
/// {accessors_mapping_for_array}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("data(uint256,uint256)", 2, 2), encodeArgs(8));
///     // ABI_CHECK(callContractFunction("data(uint256, 256)", 2, 8), encodeArgs());
///     // ABI_CHECK(callContractFunction("dynamicData(uint256,uint256)", 2, 2), encodeArgs(8));
///     // ABI_CHECK(callContractFunction("dynamicData(uint256,uint256)", 2, 8), encodeArgs());
contract test {
	mapping(uint => uint[8]) public data;
	mapping(uint => uint[]) public dynamicData;
	function test() {
		data[2][2] = 8;
		dynamicData[2].length = 3;
		dynamicData[2][2] = 8;
	}
}

