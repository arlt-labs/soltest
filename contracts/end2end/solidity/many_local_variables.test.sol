import 'many_local_variables.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract many_local_variables_Test is Soltest { 
    function test_many_local_variables() { 
        // compileAndRun(sourceCode);
        // auto f = [](u256 const& x1, u256 const& x2, u256 const& x3) -> u256
        // {
        // 	u256 a = 0x1;
        // 	u256 b = 0x10;
        // 	u256 c = 0x100;
        // 	u256 y = a + b + c + x1 + x2 + x3;
        // 	return y + b + x2;
        // };
        // testContractAgainstCpp("run(uint256,uint256,uint256)", f, u256(0x1000), u256(0x10000), u256(0x100000));
    } 
} 

