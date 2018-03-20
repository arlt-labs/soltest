import 'sha256.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract sha256_Test is Soltest { 
    function test_sha256() { 
        // compileAndRun(sourceCode);
        // auto f = [&](u256 const& _x) -> bytes
        // {
        // 	if (_x == u256(4))
        // 		return fromHex("e38990d0c7fc009880a9c07c23842e886c6bbdc964ce6bdd5817ad357335ee6f");
        // 	if (_x == u256(5))
        // 		return fromHex("96de8fc8c256fa1e1556d41af431cace7dca68707c78dd88c3acab8b17164c47");
        // 	if (_x == u256(-1))
        // 		return fromHex("af9613760f72635fbdb44a5a0a63c39f12af30f950a6ee5c971be188e89c4051");
        // 	return fromHex("");
        // };
        // testContractAgainstCpp("a(bytes32)", f, u256(4));
        // testContractAgainstCpp("a(bytes32)", f, u256(5));
        // testContractAgainstCpp("a(bytes32)", f, u256(-1));
    } 
} 

