contract C {
	/// Calling into non-existant account is successful (creates the account)
	function f() external view returns (bool) {
		return address(0x4242).call();
	}
	function g() external view returns (bool) {
		return address(0x4242).callcode();
	}
	function h() external view returns (bool) {
		return address(0x4242).delegatecall();
	}
}

