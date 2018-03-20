contract Creator {
	uint public r;
	address public ch;
	function Creator(address[3] s, uint x) {
		r = x;
		ch = s[2];
	}
}

