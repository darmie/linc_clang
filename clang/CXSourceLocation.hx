package clang;

/**
 * Identifies a specific source location within a translation
 * unit.
 *
 * Use clang_getExpansionLocation() or clang_getSpellingLocation()
 * to map a source location to a particular file, line, and column.
 */
@:keep
@:structAccess
@:include('linc_clang.h')
@:native("CXSourceLocation")
extern class CXSourceLocation {
	public var ptr_data:cpp.RawConstPointer<Void>;
	public var int_data:Int;
}
