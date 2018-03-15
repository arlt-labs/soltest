contract C {
	event Ev(bool);
	bool public perm;
	function set() returns(uint) {
		bool tmp;
		assembly {
			tmp := 5
		}
		perm = tmp;
		return 1;
	}
	function ret() returns(bool) {
		bool tmp;
		assembly {
			tmp := 5
		}
		return tmp;
	}
	function ev() returns(uint) {
		bool tmp;
		assembly {
			tmp := 5
		}
		Ev(tmp);
		return 1;
	}
}

