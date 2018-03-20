import 'multiple_inherited_state_vars.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract multiple_inherited_state_vars_Test is Soltest { 
    function test_multiple_inherited_state_vars() { 
        //
        // compileAndRun(sourceCode, 0, "C");
        // ABI_CHECK(callContractFunction("a()"), encodeArgs(u256(7)));
        // ABI_CHECK(callContractFunction("b()"), encodeArgs(u256(9)));
        // ABI_CHECK(callContractFunction("a_set(uint256)", u256(1)), encodeArgs(u256(1)));
        // ABI_CHECK(callContractFunction("b_set(uint256)", u256(3)), encodeArgs(u256(1)));
        // ABI_CHECK(callContractFunction("a()"), encodeArgs(u256(1)));
        // ABI_CHECK(callContractFunction("b()"), encodeArgs(u256(3)));
    } 
} 

