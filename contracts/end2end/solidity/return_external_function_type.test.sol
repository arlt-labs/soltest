import 'return_external_function_type.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract return_external_function_type_Test is Soltest { 
    function test_return_external_function_type() { 
        //
        // compileAndRun(sourceCode, 0, "C");
        // ABI_CHECK(
        // 	callContractFunction("f()"),
        // 	m_contractAddress.asBytes() + FixedHash<4>(dev::keccak256("g()")).asBytes() + bytes(32 - 4 - 20, 0)
        // );
    } 
} 

