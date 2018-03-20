/// @ext:soltest
/// {single_copy_with_multiple_inheritance}
///     // compileAndRun(sourceCode, 0, "Derived");
///     // ABI_CHECK(callContractFunction("getViaB()"), encodeArgs(0));
///     // ABI_CHECK(callContractFunction("setViaA(uint256)", 23), encodeArgs());
///     // ABI_CHECK(callContractFunction("getViaB()"), encodeArgs(23));
contract Base {
	uint data;
	function setData(uint i) { data = i; }
	function getViaBase() returns (uint i) { return data; }
}
contract A is Base { function setViaA(uint i) { setData(i); } }
contract B is Base { function getViaB() returns (uint i) { return getViaBase(); } }
contract Derived is Base, B, A { }

