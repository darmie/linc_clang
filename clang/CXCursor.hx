package clang;

import cpp.*;

@:keep
@:structAccess
@:include('linc_clang.h')
@:native("CXCursor")
extern class CXCursor {
	public var kind:CXCursorKind;
	public var xdata:Int;
	public var data:RawConstPointer<Void>;

	/**
	 * Retrieve the NULL cursor, which represents no entity.
	 */
	@:native("clang_getNullCursor")
	public static function getNullCursor():CXCursor;

	/**
	 * Retrieve the cursor that represents the given translation unit.
	 *
	 * The translation unit cursor can be used to start traversing the
	 * various declarations within the given translation unit.
	 */
	@:native("clang_getTranslationUnitCursor")
	public static function getTranslationUnitCursor(unit:CXTranslationUnit):CXCursor;

	/**
	 * Determine whether two cursors are equivalent.
	 */
	@:native("clang_equalCursors")
	public static function equalCursors(a:CXCursor, b:CXCursor):Int;

	/**
	 * Returns non-zero if \p cursor is null.
	 */
	@:native("clang_Cursor_isNull")
	public static function isNull(a:CXCursor):Int;


}
