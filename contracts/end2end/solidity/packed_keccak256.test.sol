import 'packed_keccak256.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract packed_keccak256_Test is Soltest { 
    function test_packed_keccak256() { 
        // compileAndRun(sourceCode);
        // auto f = [&](u256 const& _x) -> u256
        // {
        // 	return dev::keccak256(
        // 		toCompactBigEndian(unsigned(8)) +
        // 		toBigEndian(_x) +
        // 		toCompactBigEndian(unsigned(65536)) +
        // 		toBigEndian(_x) +
        // 		toBigEndian(u256(256))
        // 	);
        // };
        // testContractAgainstCpp("a(bytes32)", f, u256(4));
        // testContractAgainstCpp("a(bytes32)", f, u256(5));
        // testContractAgainstCpp("a(bytes32)", f, u256(-1));
    } 
} 

