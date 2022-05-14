package clang;

/**
 * Identifies a half-open character range in the source code.
 *
 * Use clang_getRangeStart() and clang_getRangeEnd() to retrieve the
 * starting and end locations from a source range, respectively.
 */
@:keep
@:structAccess
@:include('linc_clang.h')
@:native("CXSourceRange")
extern class CXSourceRange {
	public var ptr_data:cpp.RawConstPointer<Void>;
	public var begin_int_data:Int;
	public var end_int_data:Int;
}
