/// @ext:soltest
/// {constructor}
///     // compileAndRun(sourceCode);
///     // map<u256, byte> data;
///     // data[7] = 8;
///     // auto get = [&](u256 const& _x) -> u256
///     // {
///     // 	return data[_x];
///     // };
///     // testContractAgainstCpp("get(uint256)", get, u256(6));
///     // testContractAgainstCpp("get(uint256)", get, u256(7));
contract test {
	mapping(uint => uint) data;
	function test() {
		data[7] = 8;
	}
	function get(uint key) returns (uint value) {
		return data[key];
	}
}

