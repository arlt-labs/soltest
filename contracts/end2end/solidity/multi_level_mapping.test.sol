import 'multi_level_mapping.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

contract multi_level_mapping_Test is Soltest { 
    function test_multi_level_mapping() { 
        // compileAndRun(sourceCode);
        //
        // map<u256, map<u256, u256>> table;
        // auto f = [&](u256 const& _x, u256 const& _y, u256 const& _z) -> u256
        // {
        // 	if (_z == 0) return table[_x][_y];
        // 	else return table[_x][_y] = _z;
        // };
        // testContractAgainstCpp("f(uint256,uint256,uint256)", f, u256(4), u256(5), u256(0));
        // testContractAgainstCpp("f(uint256,uint256,uint256)", f, u256(5), u256(4), u256(0));
        // testContractAgainstCpp("f(uint256,uint256,uint256)", f, u256(4), u256(5), u256(9));
        // testContractAgainstCpp("f(uint256,uint256,uint256)", f, u256(4), u256(5), u256(0));
        // testContractAgainstCpp("f(uint256,uint256,uint256)", f, u256(5), u256(4), u256(0));
        // testContractAgainstCpp("f(uint256,uint256,uint256)", f, u256(5), u256(4), u256(7));
        // testContractAgainstCpp("f(uint256,uint256,uint256)", f, u256(4), u256(5), u256(0));
        // testContractAgainstCpp("f(uint256,uint256,uint256)", f, u256(5), u256(4), u256(0));
    } 
} 

