contract C {
	uint public x;
	function g(uint y) { x = 2 * y; assembly { stop } }
	function f(uint _x) {
		assembly {
			_x
			jump(g)
			pop
		}
	}
}

