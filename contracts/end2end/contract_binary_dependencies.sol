contract A { function f() { new B(); } }
contract B { function f() { } }
contract C { function f() { new B(); } }

