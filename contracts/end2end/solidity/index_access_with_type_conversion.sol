	contract C {
		function f(uint x) returns (uint[256] r){
			r[uint8(x)] = 2;
		}
	}

