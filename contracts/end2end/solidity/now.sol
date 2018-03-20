contract test {
	function someInfo() returns (bool equal, uint val) {
		equal = block.timestamp == now;
		val = now;
	}
}

