/// @ext:soltest
/// {storage_string_as_mapping_key_without_variable}
///     // compileAndRun(sourceCode, 0, "Test");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(2)));
contract Test {
	mapping(string => uint) data;
	function f() returns (uint) {
		data["abc"] = 2;
		return data["abc"];
	}
}

