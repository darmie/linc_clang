package clang;

import cpp.RawPointer;

/**
 * The type of an element in the abstract syntax tree.
 *
 */
@:keep
@:structAccess
@:include('linc_clang.h')
@:native("CXType")
extern class CXType {
	public var kind:CXTypeKind;
	public var data:RawPointer<Void>;
}
