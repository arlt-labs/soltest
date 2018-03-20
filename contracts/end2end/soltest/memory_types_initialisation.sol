contract Test {
	mapping(uint=>uint) data;
	function stat() returns (uint[5])
	{
		data[2] = 3; // make sure to use some memory
	}
	function dyn() returns (uint[]) { stat(); }
	function nested() returns (uint[3][]) { stat(); }
	function nestedStat() returns (uint[3][7]) { stat(); }
}

