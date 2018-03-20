import 'bytes_in_constructors_packer.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract bytes_in_constructors_packer_Test is Soltest { 
    function test_bytes_in_constructors_packer() { 
        // compileAndRun(sourceCode, 0, "Creator");
        // string s1("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz");
        // bytes dyn1 = encodeArgs(u256(s1.length()), s1);
        // u256 x = 7;
        // bytes args1 = encodeArgs(x, u256(0x40)) + dyn1;
        // BOOST_REQUIRE(
        // 	callContractFunction("f(uint256,bytes)", asString(args1)) ==
        // 	encodeArgs(x, string{s1[unsigned(x)]})
        // );
    } 
} 

