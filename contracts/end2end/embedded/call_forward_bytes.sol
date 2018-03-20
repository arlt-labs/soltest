/// @ext:soltest
/// {call_forward_bytes}
///     // compileAndRun(sourceCode, 0, "sender");
///     // ABI_CHECK(callContractFunction("receive(uint256)", 7), bytes());
///     // ABI_CHECK(callContractFunction("val()"), encodeArgs(0));
///     // ABI_CHECK(callContractFunction("forward()"), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("val()"), encodeArgs(8));
///     // ABI_CHECK(callContractFunction("clear()"), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("val()"), encodeArgs(8));
///     // ABI_CHECK(callContractFunction("forward()"), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("val()"), encodeArgs(0x80));
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

