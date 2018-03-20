import 'string_allocation_bug.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract string_allocation_bug_Test is Soltest { 
    function test_string_allocation_bug() { 
        // compileAndRun(sourceCode);
        // ABI_CHECK(callContractFunction("p(uint256)", 0), encodeArgs(
        // 	u256(0xbbbb),
        // 	u256(0xcccc),
        // 	u256(0x80),
        // 	u256(0xc0),
        // 	u256(5),
        // 	string("hello"),
        // 	u256(5),
        // 	string("world")
        // ));
    } 
} 

