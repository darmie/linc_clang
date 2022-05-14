package clang;


extern enum abstract CXEvalResultKind(Int) from Int to Int {
	var CXEval_Int = 1;
	var CXEval_Float = 2;
	var CXEval_ObjCStrLiteral = 3;
	var CXEval_StrLiteral = 4;
	var CXEval_CFStr = 5;
	var CXEval_Other = 6;
	var CXEval_UnExposed = 0;
}