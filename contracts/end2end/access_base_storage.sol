contract Base {
	uint dataBase;
	function getViaBase() returns (uint i) { return dataBase; }
}
contract Derived is Base {
	uint dataDerived;
	function setData(uint base, uint derived) returns (bool r) {
		dataBase = base;
		dataDerived = derived;
		return true;
	}
	function getViaDerived() returns (uint base, uint derived) {
		base = dataBase;
		derived = dataDerived;
	}
}

