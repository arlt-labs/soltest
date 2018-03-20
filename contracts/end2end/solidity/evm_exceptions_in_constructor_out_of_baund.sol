contract A {
	uint public test = 1;
	uint[3] arr;
	function A()
	{
		uint index = 5;
		test = arr[index];
		++test;
	}
}

