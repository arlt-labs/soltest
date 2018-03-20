import 'shift_bytes.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract shift_bytes_Test is Soltest { 
    function test_shift_bytes() { 
        // compileAndRun(sourceCode, 0, "C");
        // ABI_CHECK(callContractFunction("left(bytes20,uint8)", "12345678901234567890", 8 * 8), encodeArgs("901234567890" + string(8, 0)));
        // ABI_CHECK(callContractFunction("right(bytes20,uint8)", "12345678901234567890", 8 * 8), encodeArgs(string(8, 0) + "123456789012"));
    } 
} 

