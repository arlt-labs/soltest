contract ClientReceipt {
	event Deposit(uint fixeda, bytes dynx, uint fixedb);
	function deposit() {
		Deposit(10, msg.data, 15);
	}
}

