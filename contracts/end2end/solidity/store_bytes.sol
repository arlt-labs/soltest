contract C {
	function save() returns (uint r) {
		r = 23;
		savedData = msg.data;
		r = 24;
	}
	bytes savedData;
}

