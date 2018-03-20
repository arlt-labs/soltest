contract D { function D() payable {} }
contract C {
	uint public x;
	function C() payable {}
	function f(uint amount) returns (address) {
		x++;
		return (new D).value(amount)();
	}
	function stack(uint depth) returns (address) {
		if (depth < 1024)
			return this.stack(depth - 1);
		else
			return f(0);
	}
}

