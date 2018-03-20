contract ClientReceipt {
	bytes x;
	event Deposit(uint fixeda, bytes dynx, uint fixedb);
	function deposit() {
		x.length = 3;
		x[0] = "A";
		x[1] = "B";
		x[2] = "C";
		Deposit(10, x, 15);
	}
}

