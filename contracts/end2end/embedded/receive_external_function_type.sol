/// @ext:soltest
/// {receive_external_function_type}
///     //
///     // compileAndRun(sourceCode, 0, "C");
///     // ABI_CHECK(callContractFunction(
///     // 	"f(function)",
///     // 	m_contractAddress.asBytes() + FixedHash<4>(dev::keccak256("g()")).asBytes() + bytes(32 - 4 - 20, 0)
///     // ), encodeArgs(u256(7)));
contract C {
	function g() returns (uint) { return 7; }
	function f(function() external returns (uint) g) returns (uint) {
		return g();
	}
}

