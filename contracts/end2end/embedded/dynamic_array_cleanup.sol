/// @ext:soltest
/// {dynamic_array_cleanup}
///     // compileAndRun(sourceCode);
///     // BOOST_CHECK(storageEmpty(m_contractAddress));
///     // ABI_CHECK(callContractFunction("fill()"), bytes());
///     // BOOST_CHECK(!storageEmpty(m_contractAddress));
///     // ABI_CHECK(callContractFunction("halfClear()"), bytes());
///     // BOOST_CHECK(!storageEmpty(m_contractAddress));
///     // ABI_CHECK(callContractFunction("fullClear()"), bytes());
///     // BOOST_CHECK(storageEmpty(m_contractAddress));
contract c {
	uint[20] spacer;
	uint[] dynamic;
	function fill() {
		dynamic.length = 21;
		for (uint i = 0; i < dynamic.length; ++i) dynamic[i] = i+1;
	}
	function halfClear() { dynamic.length = 5; }
	function fullClear() { delete dynamic; }
}

