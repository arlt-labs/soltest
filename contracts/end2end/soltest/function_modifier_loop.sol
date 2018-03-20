contract C {
	modifier repeat(uint count) { for (var i = 0; i < count; ++i) _; }
	function f() repeat(10) returns (uint r) { r += 1; }
}

