library Arst {
	enum Foo {
		Things,
		Stuff
	}
}

contract Tsra {
	function f() returns(uint) {
		Arst.Foo;
		return 1;
	}
}

