contract A {
	uint data;
	function() { data = 1; }
	function getData() returns (uint r) { return data; }
}
contract B is A {}

