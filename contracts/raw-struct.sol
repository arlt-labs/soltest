pragma solidity ^0.4.0;
pragma experimental ABIEncoderV2;

contract RawStruct {
    struct Struct {
        uint a;
	uint b;
    }
    Struct d;
    address owner;
    function Raw(Struct a) public {
        owner = msg.sender;
        d = a;
    }
    function add(Struct s) public returns (uint sum)  {
        if (msg.sender == owner) {
            return s.a + s.b;
        } else {
            return 0;
        }
    }
}
