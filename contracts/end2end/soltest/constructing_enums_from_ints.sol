	contract c {
		enum Truth { False, True }
		function test() returns (uint)
		{
			return uint(Truth(uint8(0x701)));
		}
	}

