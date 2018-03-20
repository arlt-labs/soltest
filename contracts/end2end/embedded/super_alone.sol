/// @ext:soltest
/// {super_alone}
///     // compileAndRun(sourceCode, 0, "A");
///     // ABI_CHECK(callContractFunction("f()"), encodeArgs());
contract A { function f() { super; } }

