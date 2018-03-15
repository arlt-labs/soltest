contract C {
	function getOne() payable nonFree returns (uint r) { return 1; }
	modifier nonFree { if (msg.value > 0) _; }
}

