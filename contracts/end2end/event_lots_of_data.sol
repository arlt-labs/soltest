contract ClientReceipt {
	event Deposit(address _from, bytes32 _id, uint _value, bool _flag);
	function deposit(bytes32 _id) payable {
		Deposit(msg.sender, _id, msg.value, true);
	}
}

