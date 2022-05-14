package clang;

@:keep
@:structAccess
@:include('linc_clang.h')
@:native("CXStringSet")
extern class CXStringSet {
	public var strings:Array<CXString>;
	public var count:Int;
}
