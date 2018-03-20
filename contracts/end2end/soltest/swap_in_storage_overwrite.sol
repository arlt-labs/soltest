contract c {
	struct S { uint a; uint b; }
	S public x;
	S public y;
	function set() {
		x.a = 1; x.b = 2;
		y.a = 3; y.b = 4;
	}
	function swap() {
		(x, y) = (y, x);
	}
}

