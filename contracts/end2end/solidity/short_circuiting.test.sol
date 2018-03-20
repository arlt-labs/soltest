import 'short_circuiting.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract short_circuiting_Test is Soltest { 
    function test_short_circuiting() { 
        // compileAndRun(sourceCode);
        //
        // auto short_circuiting_cpp = [](u256 n) -> u256
        // {
        // 	(void)(n == 0 || (n = 8) > 0);
        // 	return n;
        // };
        //
        // testContractAgainstCppOnRange("run(uint256)", short_circuiting_cpp, 0, 2);
    } 
} 

