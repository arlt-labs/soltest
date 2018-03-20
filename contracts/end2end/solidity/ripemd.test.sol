import 'ripemd.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract ripemd_Test is Soltest { 
    function test_ripemd() { 
        // compileAndRun(sourceCode);
        // auto f = [&](u256 const& _x) -> bytes
        // {
        // 	if (_x == u256(4))
        // 		return fromHex("1b0f3c404d12075c68c938f9f60ebea4f74941a0000000000000000000000000");
        // 	if (_x == u256(5))
        // 		return fromHex("ee54aa84fc32d8fed5a5fe160442ae84626829d9000000000000000000000000");
        // 	if (_x == u256(-1))
        // 		return fromHex("1cf4e77f5966e13e109703cd8a0df7ceda7f3dc3000000000000000000000000");
        // 	return fromHex("");
        // };
        // testContractAgainstCpp("a(bytes32)", f, u256(4));
        // testContractAgainstCpp("a(bytes32)", f, u256(5));
        // testContractAgainstCpp("a(bytes32)", f, u256(-1));
    } 
} 

