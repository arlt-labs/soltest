/// @ext:soltest
/// {copy_removes_bytes_data}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("set()", 1, 2, 3, 4, 5), encodeArgs(true));
///     // BOOST_CHECK(!storageEmpty(m_contractAddress));
///     // ABI_CHECK(callContractFunction("reset()"), encodeArgs(true));
///     // BOOST_CHECK(storageEmpty(m_contractAddress));
contract c {
	function set() returns (bool) { data1 = msg.data; return true; }
	function reset() returns (bool) { data1 = data2; return true; }
	bytes data1;
	bytes data2;
}

