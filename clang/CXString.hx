package clang;

import cpp.ConstPointer;
import cpp.NativeString;
import cpp.Pointer;
import cpp.Reference;

/**
 * A character string.
 *
 * The \c CXString type is used to return strings from the interface when
 * the ownership of that string might differ from one call to the next.
 * Use \c clang_getCString() to retrieve the string data and, once finished
 * with the string data, call \c clang_disposeString() to free the string.
 */
@:keep
@:structAccess
@:include('linc_clang.h')
@:native("CXString")
extern class CXString {
	public var data:cpp.RawConstPointer<Void>;
	public var private_flags:Int;

	public static inline function toString(C:CXString):String {
		final str = Clang.getCString(C);
		Clang.disposeString(C);
		return str;
	}
}
