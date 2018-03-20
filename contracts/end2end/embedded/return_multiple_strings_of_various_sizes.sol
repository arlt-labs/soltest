/// @ext:soltest
/// {return_multiple_strings_of_various_sizes}
///     // compileAndRun(sourceCode, 0, "Main");
///     // string s1(
///     // 	"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
///     // 	"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
///     // 	"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
///     // 	"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
///     // );
///     // string s2(
///     // 	"ABCDEFGHIJKLMNOPQRSTUVXYZABCDEFGHIJKLMNOPQRSTUVXYZABCDEFGHIJKLMNOPQRSTUVXYZ"
///     // 	"ABCDEFGHIJKLMNOPQRSTUVXYZABCDEFGHIJKLMNOPQRSTUVXYZABCDEFGHIJKLMNOPQRSTUVXYZ"
///     // 	"ABCDEFGHIJKLMNOPQRSTUVXYZABCDEFGHIJKLMNOPQRSTUVXYZABCDEFGHIJKLMNOPQRSTUVXYZ"
///     // 	"ABCDEFGHIJKLMNOPQRSTUVXYZABCDEFGHIJKLMNOPQRSTUVXYZABCDEFGHIJKLMNOPQRSTUVXYZ"
///     // 	"ABCDEFGHIJKLMNOPQRSTUVXYZABCDEFGHIJKLMNOPQRSTUVXYZABCDEFGHIJKLMNOPQRSTUVXYZ"
///     // );
///     // vector<size_t> lengthes{0, 30, 32, 63, 64, 65, 210, 300};
///     // for (auto l1: lengthes)
///     // 	for (auto l2: lengthes)
///     // 	{
///     // 		bytes dyn1 = encodeArgs(u256(l1), s1.substr(0, l1));
///     // 		bytes dyn2 = encodeArgs(u256(l2), s2.substr(0, l2));
///     // 		bytes args = encodeArgs(u256(0x60), u256(l1), u256(0x60 + dyn1.size())) + dyn1 + dyn2;
///     // 		BOOST_REQUIRE(
///     // 			callContractFunction("set(string,uint256,string)", asString(args)) ==
///     // 			encodeArgs(u256(l1))
///     // 		);
///     // 		bytes result = encodeArgs(u256(0x40), u256(0x40 + dyn1.size())) + dyn1 + dyn2;
///     // 		ABI_CHECK(callContractFunction("get()"), result);
///     // 		ABI_CHECK(callContractFunction("s1()"), encodeArgs(0x20) + dyn1);
///     // 		ABI_CHECK(callContractFunction("s2()"), encodeArgs(0x20) + dyn2);
///     // 	}
contract Main {
	string public s1;
	string public s2;
	function set(string _s1, uint x, string _s2) external returns (uint) {
		s1 = _s1;
		s2 = _s2;
		return x;
	}
	function get() returns (string r1, string r2) {
		r1 = s1;
		r2 = s2;
	}
}

