import 'nested_loops.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract nested_loops_Test is Soltest { 
    function test_nested_loops() { 
        // compileAndRun(sourceCode);
        //
        // auto nested_loops_cpp = [](u256 n) -> u256
        // {
        // 	while (n > 1)
        // 	{
        // 		if (n == 10)
        // 			break;
        // 		while (n > 5)
        // 		{
        // 			if (n == 8)
        // 				break;
        // 			n--;
        // 			if (n == 6)
        // 				continue;
        // 			return n;
        // 		}
        // 		n--;
        // 		if (n == 3)
        // 			continue;
        // 		break;
        // 	}
        //
        // 	return n;
        // };
        //
        // testContractAgainstCppOnRange("f(uint256)", nested_loops_cpp, 0, 12);
    } 
} 

