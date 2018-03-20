/// @ext:soltest
/// {copying_bytes_multiassign}
///     // compileAndRun(sourceCode, 0, "sender");
///     // ABI_CHECK(callContractFunction("receive(uint256)", 7), bytes());
///     // ABI_CHECK(callContractFunction("val()"), encodeArgs(0));
///     // ABI_CHECK(callContractFunction("forward(bool)", true), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("val()"), encodeArgs(8));
///     // ABI_CHECK(callContractFunction("forward(bool)", false), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("val()"), encodeArgs(16));
///     // ABI_CHECK(callContractFunction("forward(bool)", true), encodeArgs(true));
///     // ABI_CHECK(callContractFunction("val()"), encodeArgs(0x80));
contract receiver {
	uint public received;
	function receive(uint x) { received += x + 1; }
	function() { received = 0x80; }
}
contract sender {
	function sender() { rec = new receiver(); }
	function() { savedData1 = savedData2 = msg.data; }
	function forward(bool selector) returns (bool) {
		if (selector) { rec.call(savedData1); delete savedData1; }
		else { rec.call(savedData2); delete savedData2; }
		return true;
	}
	function val() returns (uint) { return rec.received(); }
	receiver rec;
	bytes savedData1;
	bytes savedData2;
}

