import 'contracts/MyRegistry.sol';
import 'Soltest.sol'; // this file will be virtually provided by the testing environment - it's not existing physically.

// Deriving from `Soltest` marks the contract as a test and gives you access to various test helpers.
contract MyRegistryTest is Soltest {
    MyRegistry reg;
    function setUp() {
        reg = new MyRegistry();
    }

    function testCreatorIsCreator() {
        assert(address(this) == reg._creator());
    }

    function testFailNonCreatorSet() {
        reg.set("no", "stop");
        //
        // asdasdasd
        //
    }

    function testSetEvent() {
        //
        reg.set("hello", "hi");
        //
        //
    }
}
