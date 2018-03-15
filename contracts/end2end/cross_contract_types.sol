contract Lib { struct S {uint a; uint b; } }
contract Test {
	function f() returns (uint r) {
		var x = Lib.S({a: 2, b: 3});
		r = x.b;
	}
}

