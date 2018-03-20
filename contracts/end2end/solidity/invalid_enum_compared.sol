contract C {
	enum X { A, B }

	function test_eq() returns (bool) {
		X garbled;
		assembly {
			garbled := 5
		}
		return garbled == garbled;
	}
	function test_eq_ok() returns (bool) {
		X garbled = X.A;
		return garbled == garbled;
	}
	function test_neq() returns (bool) {
		X garbled;
		assembly {
			garbled := 5
		}
		return garbled != garbled;
	}
}

