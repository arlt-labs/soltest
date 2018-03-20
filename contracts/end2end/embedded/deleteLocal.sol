/// @ext:soltest
/// {deleteLocal}
///     // compileAndRun(sourceCode);
///     // ABI_CHECK(callContractFunction("delLocal()"), encodeArgs(0));
contract test {
	function delLocal() returns (uint res){
		uint v = 5;
		delete v;
		res = v;
	}
}

