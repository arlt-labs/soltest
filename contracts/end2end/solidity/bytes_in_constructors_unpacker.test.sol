import 'bytes_in_constructors_unpacker.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract bytes_in_constructors_unpacker_Test is Soltest { 
    function test_bytes_in_constructors_unpacker() { 
        // string s1("abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz");
        // bytes dyn1 = encodeArgs(u256(s1.length()), s1);
        // u256 x = 7;
        // bytes args1 = encodeArgs(x, u256(0x40)) + dyn1;
        // compileAndRun(sourceCode, 0, "Test", args1);
        // BOOST_REQUIRE(callContractFunction("m_x()") == encodeArgs(x));
        // BOOST_REQUIRE(callContractFunction("m_s()") == encodeArgs(u256(0x20)) + dyn1);
    } 
} 

