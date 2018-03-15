contract C {
	enum X { A, B }

	function test_return() returns (X) {
		X garbled;
		assembly {
			garbled := 5
		}
		return garbled;
	}
	function test_inline_assignment() returns (X _ret) {
		assembly {
			_ret := 5
		}
	}
	function test_assignment() returns (X _ret) {
		X tmp;
		assembly {
			tmp := 5
		}
		_ret = tmp;
	}
}

