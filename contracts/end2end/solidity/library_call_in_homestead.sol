library Lib { function m() returns (address) { return msg.sender; } }
contract Test {
	address public sender;
	function f() {
		sender = Lib.m();
	}
}

