import 'shift_overflow.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract shift_overflow_Test is Soltest { 
    function test_shift_overflow() { 
        // compileAndRun(sourceCode, 0, "C");
        // ABI_CHECK(callContractFunction("leftU(uint8,uint8)", 255, 8), encodeArgs(u256(0)));
        // ABI_CHECK(callContractFunction("leftU(uint8,uint8)", 255, 1), encodeArgs(u256(254)));
        // ABI_CHECK(callContractFunction("leftU(uint8,uint8)", 255, 0), encodeArgs(u256(255)));
        //
        // // Result is -128 and output is sign-extended, not zero-padded.
        // ABI_CHECK(callContractFunction("leftS(int8,int8)", 1, 7), encodeArgs(u256(0) - 128));
        // ABI_CHECK(callContractFunction("leftS(int8,int8)", 1, 6), encodeArgs(u256(64)));
    } 
} 

