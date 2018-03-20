/// @ext:soltest
/// {send_zero_ether}
///     // compileAndRun(sourceCode, 20, "Main");
///     // BOOST_REQUIRE(callContractFunction("s()") == encodeArgs(true));
contract Receiver {
	function () payable {
	}
}
contract Main {
	function Main() payable {}
	function s() returns (bool) {
		var r = new Receiver();
		return r.send(0);
	}
}

