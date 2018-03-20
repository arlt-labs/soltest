contract Base {
	uint data;
	function setData(uint i) { data = i; }
	function getViaBase() returns (uint i) { return data; }
}
contract A is Base { function setViaA(uint i) { setData(i); } }
contract B is Base { function getViaB() returns (uint i) { return getViaBase(); } }
contract Derived is Base, B, A { }

