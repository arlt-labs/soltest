pragma solidity ^0.4.0;

/// @ext:soltest
/// {test 01}
///     uint16 d1 = 1;
/// {test 02}
///     uint16 d2 = 2;
contract SimpleEmbedded {
    uint16 d;
    address owner;

    /// @ext:soltest
    /// {test 03}
    ///     uint16 d3 = 3;
    /// {test 04}
    ///     uint16 d4 = 4;
    /// @author test
    function SimpleEmbedded(uint16 a) public {
        owner = msg.sender;
        d = a;
    }

    /// @ext:soltest
    /// {test 05}
    ///     uint16 d5 = 5;
    /// @author test2
    function add(uint16 a, uint16 b) public returns (uint16 sum)  {
        if (msg.sender == owner) {
            return a + b + d;
        } else {
            return a + b;
        }
    }

    /// @ext:soltest
    /// {test 06}
    ///     uint16 d6 = 6;
    /// {test 07}
    ///     uint16 d7 = 7;
    function add2(uint16 a, uint16 b) public returns (uint16 sum)  {
        if (msg.sender == owner) {
            return a + b + d;
        } else {
            return a + b;
        }
    }
}
