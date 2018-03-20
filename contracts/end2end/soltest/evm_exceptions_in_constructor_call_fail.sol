contract A {
	function A()
	{
		this.call("123");
	}
}
contract B {
	uint public test = 1;
	function testIt()
	{
		A a = new A();
		++test;
	}
}

