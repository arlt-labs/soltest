contract init {
	function isOk() returns (bool) { return false; }
	bool public ok = false;
}
contract fix {
	function isOk() returns (bool) { return true; }
	bool public ok = true;
}

contract init_fix is init, fix {
	function checkOk() returns (bool) { return ok; }
}
contract fix_init is fix, init {
	function checkOk() returns (bool) { return ok; }
}

