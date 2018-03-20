import 'reusing_memory.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract reusing_memory_Test is Soltest { 
    function test_reusing_memory() { 
        // compileAndRun(sourceCode, 0, "Main");
        // BOOST_REQUIRE(callContractFunction("f(uint256)", 0x34) == encodeArgs(dev::keccak256(dev::toBigEndian(u256(0x34)))));
    } 
} 

