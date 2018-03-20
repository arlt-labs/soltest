/// @ext:soltest
/// {array_copy_storage_storage_dyn_dyn}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("setData1(uint256,uint256,uint256)", 10, 5, 4), bytes());
///     // ABI_CHECK(callContractFunction("copyStorageStorage()"), bytes());
///     // ABI_CHECK(callContractFunction("getData2(uint256)", 5), encodeArgs(10, 4));
///     // ABI_CHECK(callContractFunction("setData1(uint256,uint256,uint256)", 0, 0, 0), bytes());
///     // ABI_CHECK(callContractFunction("copyStorageStorage()"), bytes());
///     // ABI_CHECK(callContractFunction("getData2(uint256)", 0), encodeArgs(0, 0));
///     // BOOST_CHECK(storageEmpty(m_contractAddress));
contract c {
	uint[] data1;
	uint[] data2;
	function setData1(uint length, uint index, uint value) {
		data1.length = length; if (index < length) data1[index] = value;
	}
	function copyStorageStorage() { data2 = data1; }
	function getData2(uint index) returns (uint len, uint val) {
		len = data2.length; if (index < len) val = data2[index];
	}
}

