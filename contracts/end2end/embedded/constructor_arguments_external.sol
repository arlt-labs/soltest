/// @ext:soltest
/// {constructor_arguments_external}
///     // compileAndRun(sourceCode, 0, "Main", encodeArgs("abc", true));
///     // ABI_CHECK(callContractFunction("getFlag()"), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("getName()"), encodeArgs("abc"));
contract Main {
	bytes3 name;
	bool flag;

	function Main(bytes3 x, bool f) {
		name = x;
		flag = f;
	}
	function getName() returns (bytes3 ret) { return name; }
	function getFlag() returns (bool ret) { return flag; }
}

