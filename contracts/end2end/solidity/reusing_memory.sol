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

