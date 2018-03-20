import 'gas_and_value_basic.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract gas_and_value_basic_Test is Soltest { 
    function test_gas_and_value_basic() { 
        // compileAndRun(sourceCode, 20);
        // BOOST_REQUIRE(callContractFunction("sendAmount(uint256)", 5) == encodeArgs(5));
        // // call to helper should not succeed but amount should be transferred anyway
        // BOOST_REQUIRE(callContractFunction("outOfGas()") == bytes());
        // BOOST_REQUIRE(callContractFunction("checkState()") == encodeArgs(false, 20 - 5));
    } 
} 

