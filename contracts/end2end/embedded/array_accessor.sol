/// @ext:soltest
/// {array_accessor}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("data(uint256)", 0), encodeArgs(8));
///     // ABI_CHECK(callContractFunction("data(uint256)", 8), encodeArgs());
///     // ABI_CHECK(callContractFunction("dynamicData(uint256)", 2), encodeArgs(8));
///     // ABI_CHECK(callContractFunction("dynamicData(uint256)", 8), encodeArgs());
///     // ABI_CHECK(callContractFunction("smallTypeData(uint256)", 1), encodeArgs(22));
///     // ABI_CHECK(callContractFunction("smallTypeData(uint256)", 127), encodeArgs(2));
///     // ABI_CHECK(callContractFunction("smallTypeData(uint256)", 128), encodeArgs());
///     // ABI_CHECK(callContractFunction("multiple_map(uint256,uint256,uint256)", 2, 1, 2), encodeArgs(3));
contract test {
	uint[8] public data;
	uint[] public dynamicData;
	uint24[] public smallTypeData;
	struct st { uint a; uint[] finalArray; }
	mapping(uint256 => mapping(uint256 => st[5])) public multiple_map;

	function test() {
		data[0] = 8;
		dynamicData.length = 3;
		dynamicData[2] = 8;
		smallTypeData.length = 128;
		smallTypeData[1] = 22;
		smallTypeData[127] = 2;
		multiple_map[2][1][2].a = 3;
		multiple_map[2][1][2].finalArray.length = 4;
		multiple_map[2][1][2].finalArray[3] = 5;
	}
}

