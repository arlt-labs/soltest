import 'calling_nonexisting_contract_throws.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract calling_nonexisting_contract_throws_Test is Soltest { 
    function test_calling_nonexisting_contract_throws() { 
        // compileAndRun(sourceCode, 0, "C");
        // ABI_CHECK(callContractFunction("f()"), encodeArgs());
        // ABI_CHECK(callContractFunction("g()"), encodeArgs());
        // ABI_CHECK(callContractFunction("h()"), encodeArgs(u256(7)));
    } 
} 

