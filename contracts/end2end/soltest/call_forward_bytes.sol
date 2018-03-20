contract receiver {
	uint public received;
	function receive(uint x) { received += x + 1; }
	function() { received = 0x80; }
}
contract sender {
	function sender() { rec = new receiver(); }
	function() { savedData = msg.data; }
	function forward() returns (bool) { !rec.call(savedData); return true; }
	function clear() returns (bool) { delete savedData; return true; }
	function val() returns (uint) { return rec.received(); }
	receiver rec;
	bytes savedData;
}

