import 'bytes_from_calldata_to_memory.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract bytes_from_calldata_to_memory_Test is Soltest { 
    function test_bytes_from_calldata_to_memory() { 
        // compileAndRun(sourceCode);
        // bytes calldata1 = FixedHash<4>(dev::keccak256("f()")).asBytes() + bytes(61, 0x22) + bytes(12, 0x12);
        // sendMessage(calldata1, false);
        // BOOST_CHECK(m_output == encodeArgs(dev::keccak256(bytes{'a', 'b', 'c'} + calldata1)));
    } 
} 

