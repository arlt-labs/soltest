/// @ext:soltest
/// {mapping_state_inc_dec}
///     // compileAndRun(sourceCode);
///     //
///     // u256 value = 0;
///     // map<u256, u256> table;
///     // auto f = [&](u256 const& _x) -> u256
///     // {
///     // 	value = _x;
///     // 	if (_x > 0)
///     // 		table[++value] = 8;
///     // 	if (_x > 1)
///     // 		value --;
///     // 	if (_x > 2)
///     // 		table[value]++;
///     // 	return --table[value++];
///     // };
///     // testContractAgainstCppOnRange("f(uint256)", f, 0, 5);
contract test {
	uint value;
	mapping(uint => uint) table;
	function f(uint x) returns (uint y) {
		value = x;
		if (x > 0) table[++value] = 8;
		if (x > 1) value--;
		if (x > 2) table[value]++;
		return --table[value++];
	}
}

