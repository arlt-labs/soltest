import 'bytes_inside_mappings.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract bytes_inside_mappings_Test is Soltest { 
    function test_bytes_inside_mappings() { 
        // compileAndRun(sourceCode);
        // // store a short byte array at 1 and a longer one at 2
        // ABI_CHECK(callContractFunction("set(uint256)", 1, 2), encodeArgs(true));
        // ABI_CHECK(callContractFunction("set(uint256)", 2, 2, 3, 4, 5), encodeArgs(true));
        // BOOST_CHECK(!storageEmpty(m_contractAddress));
        // // copy shorter to longer
        // ABI_CHECK(callContractFunction("copy(uint256,uint256)", 1, 2), encodeArgs(true));
        // BOOST_CHECK(!storageEmpty(m_contractAddress));
        // // copy empty to both
        // ABI_CHECK(callContractFunction("copy(uint256,uint256)", 99, 1), encodeArgs(true));
        // BOOST_CHECK(!storageEmpty(m_contractAddress));
        // ABI_CHECK(callContractFunction("copy(uint256,uint256)", 99, 2), encodeArgs(true));
        // BOOST_CHECK(storageEmpty(m_contractAddress));
    } 
} 

