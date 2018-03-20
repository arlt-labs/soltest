/// @ext:soltest
/// {copy_from_calldata_removes_bytes_data}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("set()", 1, 2, 3, 4, 5), encodeArgs(true));
///     // BOOST_CHECK(!storageEmpty(m_contractAddress));
///     // sendMessage(bytes(), false);
///     // BOOST_CHECK(m_output == bytes());
///     // BOOST_CHECK(storageEmpty(m_contractAddress));
contract c {
	function set() returns (bool) { data = msg.data; return true; }
	function() { data = msg.data; }
	bytes data;
}

