contract A { function f() returns (uint r) { return 1; } }
contract B is A { function f() returns (uint r) { return super.f() | 2; } }
contract C is A { function f() returns (uint r) { return super.f() | 4; } }
contract D is B, C { uint data; function D() { data = super.f() | 8; } function f() returns (uint r) { return data; } }

