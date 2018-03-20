contract C {
	function f() pure returns (uint a, uint b) {
		assembly {
			let x
			let y, z
			a := x
			b := z
		}
	}
}

