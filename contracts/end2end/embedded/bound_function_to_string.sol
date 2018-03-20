library D { function length(string memory self) returns (uint) { return bytes(self).length; } }
/// @ext:soltest
/// {bound_function_to_string}
///     // compileAndRun(sourceCode, 0, "D");
///     // compileAndRun(sourceCode, 0, "C", bytes(), map<string, Address>{{"D", m_contractAddress}});
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs(u256(3)));
///     // ABI_CHECK(callContractFunction("g()"), encodeArgs(u256(3)));
contract C {
	using D for string;
	string x;
	function f() returns (uint) {
		x = "abc";
		return x.length();
	}
	function g() returns (uint) {
		string memory s = "abc";
		return s.length();
	}
}

