import 'shift_left_assignment.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract shift_left_assignment_Test is Soltest { 
    function test_shift_left_assignment() { 
        // compileAndRun(sourceCode, 0, "C");
        // ABI_CHECK(callContractFunction("f(uint256,uint256)", u256(0x4266), u256(0)), encodeArgs(u256(0x4266)));
        // ABI_CHECK(callContractFunction("f(uint256,uint256)", u256(0x4266), u256(8)), encodeArgs(u256(0x426600)));
        // ABI_CHECK(callContractFunction("f(uint256,uint256)", u256(0x4266), u256(16)), encodeArgs(u256(0x42660000)));
        // ABI_CHECK(callContractFunction("f(uint256,uint256)", u256(0x4266), u256(17)), encodeArgs(u256(0x84cc0000)));
        // ABI_CHECK(callContractFunction("f(uint256,uint256)", u256(0x4266), u256(240)), fromHex("4266000000000000000000000000000000000000000000000000000000000000"));
        // ABI_CHECK(callContractFunction("f(uint256,uint256)", u256(0x4266), u256(256)), encodeArgs(u256(0)));
    } 
} 

