/// @ext:soltest
/// {fixed_array_cleanup}
///     // compileAndRun(sourceCode);
///     // BOOST_CHECK(storageEmpty(m_contractAddress));
///     // ABI_CHECK(callContractFunction("fill()"), bytes());
///     // BOOST_CHECK(!storageEmpty(m_contractAddress));
///     // ABI_CHECK(callContractFunction("clear()"), bytes());
///     // BOOST_CHECK(storageEmpty(m_contractAddress));
contract c {
	uint spacer1;
	uint spacer2;
	uint[20] data;
	function fill() {
		for (uint i = 0; i < data.length; ++i) data[i] = i+1;
	}
	function clear() { delete data; }
}

