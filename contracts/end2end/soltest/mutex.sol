contract mutexed {
	bool locked;
	modifier protected {
		if (locked) throw;
		locked = true;
		_;
		locked = false;
	}
}
contract Fund is mutexed {
	uint shares;
	function Fund() payable { shares = msg.value; }
	function withdraw(uint amount) protected returns (uint) {
		// NOTE: It is very bad practice to write this function this way.
		// Please refer to the documentation of how to do this properly.
		if (amount > shares) throw;
		if (!msg.sender.call.value(amount)()) throw;
		shares -= amount;
		return shares;
	}
	function withdrawUnprotected(uint amount) returns (uint) {
		// NOTE: It is very bad practice to write this function this way.
		// Please refer to the documentation of how to do this properly.
		if (amount > shares) throw;
		if (!msg.sender.call.value(amount)()) throw;
		shares -= amount;
		return shares;
	}
}
contract Attacker {
	Fund public fund;
	uint callDepth;
	bool protected;
	function setProtected(bool _protected) { protected = _protected; }
	function Attacker(Fund _fund) { fund = _fund; }
	function attack() returns (uint) {
		callDepth = 0;
		return attackInternal();
	}
	function attackInternal() internal returns (uint) {
		if (protected)
			return fund.withdraw(10);
		else
			return fund.withdrawUnprotected(10);
	}
	function() payable {
		callDepth++;
		if (callDepth < 4)
			attackInternal();
	}
}

