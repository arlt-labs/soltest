/// @ext:soltest
/// {reusing_memory}
///     // compileAndRun(sourceCode, 0, "Main");
///     // BOOST_REQUIRE(callContractFunction("f(uint256)", 0x34) == encodeArgs(dev::keccak256(dev::toBigEndian(u256(0x34)))));
contract Helper {
	uint public flag;
	function Helper(uint x) {
		flag = x;
	}
}
contract Main {
	mapping(uint => uint) map;
	function f(uint x) returns (uint) {
		map[x] = x;
		return (new Helper(uint(keccak256(this.g(map[x]))))).flag();
	}
	function g(uint a) returns (uint)
	{
		return map[a];
	}
}

