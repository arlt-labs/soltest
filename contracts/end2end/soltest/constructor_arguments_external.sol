contract Main {
	bytes3 name;
	bool flag;

	function Main(bytes3 x, bool f) {
		name = x;
		flag = f;
	}
	function getName() returns (bytes3 ret) { return name; }
	function getFlag() returns (bool ret) { return flag; }
}

