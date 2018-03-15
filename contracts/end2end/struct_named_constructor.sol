contract C {
	struct S { uint a; bool x; }
	S public s;
	function C() {
		s = S({a: 1, x: true});
	}
}

