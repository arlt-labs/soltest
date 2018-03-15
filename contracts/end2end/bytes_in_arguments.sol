contract c {
	uint result;
	function f(uint a, uint b) { result += a + b; }
	function g(uint a) { result *= a; }
	function test(uint a, bytes data1, bytes data2, uint b) external returns (uint r_a, uint r, uint r_b, uint l) {
		r_a = a;
		this.call(data1);
		this.call(data2);
		r = result;
		r_b = b;
		l = data1.length;
	}
}

