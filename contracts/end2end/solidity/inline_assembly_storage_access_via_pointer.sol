contract C {
	struct Data { uint contents; }
	uint public separator;
	Data public a;
	uint public separator2;
	function f() returns (bool) {
		Data x = a;
		uint off;
		assembly {
			sstore(x_slot, 7)
			off := x_offset
		}
		assert(off == 0);
		return true;
	}
}

