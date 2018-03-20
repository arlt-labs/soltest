import 'empty_contract.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract empty_contract_Test is Soltest { 
    function test_empty_contract() { 
        // compileAndRun(sourceCode);
        // BOOST_CHECK(callContractFunction("i_am_not_there()", bytes()).empty());
    } 
} 

