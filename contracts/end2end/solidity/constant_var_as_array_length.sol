contract C {
	uint constant LEN = 3;
	uint[LEN] public a;

	function C(uint[LEN] _a) {
		a = _a;
	}
}

