import 'calling_other_functions.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract calling_other_functions_Test is Soltest { 
    function test_calling_other_functions() { 
        // compileAndRun(sourceCode);
        //
        // auto evenStep_cpp = [](u256 const& n) -> u256
        // {
        // 	return n / 2;
        // };
        //
        // auto oddStep_cpp = [](u256 const& n) -> u256
        // {
        // 	return 3 * n + 1;
        // };
        //
        // auto collatz_cpp = [&evenStep_cpp, &oddStep_cpp](u256 n) -> u256
        // {
        // 	u256 y;
        // 	while ((y = n) > 1)
        // 	{
        // 		if (n % 2 == 0)
        // 			n = evenStep_cpp(n);
        // 		else
        // 			n = oddStep_cpp(n);
        // 	}
        // 	return y;
        // };
        //
        // testContractAgainstCpp("run(uint256)", collatz_cpp, u256(0));
        // testContractAgainstCpp("run(uint256)", collatz_cpp, u256(1));
        // testContractAgainstCpp("run(uint256)", collatz_cpp, u256(2));
        // testContractAgainstCpp("run(uint256)", collatz_cpp, u256(8));
        // testContractAgainstCpp("run(uint256)", collatz_cpp, u256(127));
    } 
} 

