/// @ext:soltest
/// {functions_called_by_constructor}
///     // compileAndRun(sourceCode);
///     // BOOST_REQUIRE(callContractFunction("getName()") == encodeArgs("abc"));
contract Test {
	bytes3 name;
	bool flag;
	function Test() {
		setName("abc");
	}
	function getName() returns (bytes3 ret) { return name; }
	function setName(bytes3 _name) private { name = _name; }
}

