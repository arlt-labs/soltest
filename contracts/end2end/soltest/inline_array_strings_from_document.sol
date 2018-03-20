contract C {
	function f(uint i) returns (string) {
		string[4] memory x = ["This", "is", "an", "array"];
		return (x[i]);
	}
}

