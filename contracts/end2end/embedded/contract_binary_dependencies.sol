/// @ext:soltest
/// {contract_binary_dependencies}
///     // compileAndRun(sourceCode);
contract A { function f() { new B(); } }
contract B { function f() { } }
contract C { function f() { new B(); } }

