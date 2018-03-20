/// @ext:soltest
/// {fixed_arrays_in_storage}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("setIDStatic(uint256)", 11), bytes());
///     // ABI_CHECK(callContractFunction("getID(uint256)", 2), encodeArgs(11));
///     // ABI_CHECK(callContractFunction("setID(uint256,uint256)", 7, 8), bytes());
///     // ABI_CHECK(callContractFunction("getID(uint256)", 7), encodeArgs(8));
///     // ABI_CHECK(callContractFunction("setData(uint256,uint256,uint256)", 7, 8, 9), bytes());
///     // ABI_CHECK(callContractFunction("setData(uint256,uint256,uint256)", 8, 10, 11), bytes());
///     // ABI_CHECK(callContractFunction("getData(uint256)", 7), encodeArgs(8, 9));
///     // ABI_CHECK(callContractFunction("getData(uint256)", 8), encodeArgs(10, 11));
///     // ABI_CHECK(callContractFunction("getLengths()"), encodeArgs(u256(1) << 10, (u256(1) << 10) + 3));
contract c {
	struct Data { uint x; uint y; }
	Data[2**10] data;
	uint[2**10 + 3] ids;
	function setIDStatic(uint id) { ids[2] = id; }
	function setID(uint index, uint id) { ids[index] = id; }
	function setData(uint index, uint x, uint y) { data[index].x = x; data[index].y = y; }
	function getID(uint index) returns (uint) { return ids[index]; }
	function getData(uint index) returns (uint x, uint y) { x = data[index].x; y = data[index].y; }
	function getLengths() returns (uint l1, uint l2) { l1 = data.length; l2 = ids.length; }
}

