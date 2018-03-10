contract MyRegistry {
    address public _creator;
    mapping(bytes32=>bytes32) _values;
    event Set(bytes32 indexed key, bytes32 value);
    function MyRegistry() {
        _creator = msg.sender;
    }
    function set(bytes32 key, bytes32 value) {
        if( msg.sender != _creator ) {
            throw;
        }
        _values[key] = value;
        Set(key, value);
    }
    function get(bytes32 key) constant returns (bytes32 value) {
        return _values[key];
    }
}