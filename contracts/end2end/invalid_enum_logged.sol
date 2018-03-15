contract C {
	enum X { A, B }
	event Log(X);

	function test_log() returns (uint) {
		X garbled = X.A;
		assembly {
			garbled := 5
		}
		Log(garbled);
		return 1;
	}
	function test_log_ok() returns (uint) {
		X x = X.A;
		Log(x);
		return 1;
	}
}

