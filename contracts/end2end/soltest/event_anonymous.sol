contract ClientReceipt {
	event Deposit() anonymous;
	function deposit() {
		Deposit();
	}
}

