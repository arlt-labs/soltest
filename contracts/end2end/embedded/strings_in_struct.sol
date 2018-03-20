/// @ext:soltest
/// {strings_in_struct}
///     // compileAndRun(sourceCode);
///     // string s = "asdfghjkl";
///     // ABI_CHECK(callContractFunction("getFirst()"), encodeArgs(u256(10)));
///     // ABI_CHECK(callContractFunction("getSecond()"), encodeArgs(u256(20)));
///     // ABI_CHECK(callContractFunction("getThird()"), encodeArgs(u256(30)));
///     // ABI_CHECK(callContractFunction("getLast()"), encodeDyn(s));
contract buggystruct {
	Buggy public bug;

	struct Buggy {
		uint first;
		uint second;
		uint third;
		string last;
	}

	function buggystruct(){
		bug = Buggy(10, 20, 30, "asdfghjkl");
	}
	function getFirst() returns (uint)
	{
		return bug.first;
	}
	function getSecond() returns (uint)
	{
		return bug.second;
	}
	function getThird() returns (uint)
	{
		return bug.third;
	}
	function getLast() returns (string)
	{
		return bug.last;
	}
}

