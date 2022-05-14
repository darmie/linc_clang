package clang;

import cpp.Int64;
import cpp.Float64;

@:keep
@:include('linc_clang.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('clang'))
#end
extern class Clang {
	/**
	 * Provides a shared context for creating translation units.
	 *
	 * It provides two options:
	 *
	 * - excludeDeclarationsFromPCH: When non-zero, allows enumeration of "local"
	 * declarations (when loading any new translation units). A "local" declaration
	 * is one that belongs in the translation unit itself and not in a precompiled
	 * header that was used by the translation unit. If zero, all declarations
	 * will be enumerated.
	 *
	 * Here is an example:
	 *
	 * \code
	 *   // excludeDeclsFromPCH = 1, displayDiagnostics=1
	 *   Idx = clang_createIndex(1, 1);
	 *
	 *   // IndexTest.pch was produced with the following command:
	 *   // "clang -x c IndexTest.h -emit-ast -o IndexTest.pch"
	 *   TU = clang_createTranslationUnit(Idx, "IndexTest.pch");
	 *
	 *   // This will load all the symbols from 'IndexTest.pch'
	 *   clang_visitChildren(clang_getTranslationUnitCursor(TU),
	 *                       TranslationUnitVisitor, 0);
	 *   clang_disposeTranslationUnit(TU);
	 *
	 *   // This will load all the symbols from 'IndexTest.c', excluding symbols
	 *   // from 'IndexTest.pch'.
	 *   char *args[] = { "-Xclang", "-include-pch=IndexTest.pch" };
	 *   TU = clang_createTranslationUnitFromSourceFile(Idx, "IndexTest.c", 2, args,
	 *                                                  0, 0);
	 *   clang_visitChildren(clang_getTranslationUnitCursor(TU),
	 *                       TranslationUnitVisitor, 0);
	 *   clang_disposeTranslationUnit(TU);
	 * \endcode
	 *
	 * This process of creating the 'pch', loading it separately, and using it (via
	 * -include-pch) allows 'excludeDeclsFromPCH' to remove redundant callbacks
	 * (which gives the indexer the same performance benefit as the compiler).
	 */
	@:native("clang_createIndex")
	public static function createIndex(excludeDeclarationsFromPCH:Int, displayDiagnostics:Int):CXIndex;

	/**
	 * Destroy the given index.
	 *
	 * The index must not be destroyed until all of the translation units created
	 * within that index have been destroyed.
	 */
	@:native("clang_disposeIndex")
	public static function disposeIndex(index:CXIndex):Void;

	/**
	 * Determine the number of diagnostics produced for the given
	 * translation unit.
	 */
	@:native("clang_getNumDiagnostics")
	public static function getNumDiagnostics(unit:CXTranslationUnit):Int;

	/**
	 * Retrieve a diagnostic associated with the given translation unit.
	 *
	 * @param Unit the translation unit to query.
	 * @param Index the zero-based diagnostic number to retrieve.
	 *
	 * @returns the requested diagnostic. This diagnostic must be freed
	 * via a call to \c clang_disposeDiagnostic().
	 */
	@:native("clang_getDiagnostic")
	public static function getDiagnostic(unit:CXTranslationUnit, index:Int):CXDiagnostic;

	/**
	 * Destroy a diagnostic.
	 */
	@:native("clang_disposeDiagnostic")
	public static function disposeDiagnostic(unit:CXTranslationUnit):Void;

	/**
	 * Same as \c clang_parseTranslationUnit2, but returns
	 * the \c CXTranslationUnit instead of an error code.  In case of an error this
	 * routine returns a \c NULL \c CXTranslationUnit, without further detailed
	 * error codes.
	 */
	@:native("clang_parseTranslationUnit")
	public static function parseTranslationUnit(CIdx:CXIndex, source_filename:String, command_line_args:Array<String>, num_command_line_args:Int,
		unsaved_files:Array<CXUnsavedFile>, num_unsaved_files:Int, options:Int):CXTranslationUnit;

	/**
	 * Destroy the specified CXTranslationUnit object.
	 */
	@:native("clang_disposeTranslationUnit")
	public static function disposeTranslationUnit(unit:CXTranslationUnit):Void;

	/**
	 * Returns the kind of the evaluated result.
	 */
	@:native("clang_EvalResult_getKind")
	public static function EvalResult_getKind(E:CXEvalResult):CXEvalResultKind;

	/**
	 * Returns the evaluation result as integer if the
	 * kind is Int.
	 */
	@:native("clang_EvalResult_getAsInt")
	public static function EvalResult_getAsInt(E:CXEvalResult):Int;

	/**
	 * Returns the evaluation result as a long long integer if the
	 * kind is Int. This prevents overflows that may happen if the result is
	 * returned with clang_EvalResult_getAsInt.
	 */
	@:native("clang_EvalResult_getAsLongLong")
	public static function EvalResult_getAsLongLong(E:CXEvalResult):Int64;

	/**
	 * Returns the evaluation result as double if the
	 * kind is double.
	 */
	@:native("clang_EvalResult_getAsDouble")
	public static function EvalResult_getAsDouble(E:CXEvalResult):Float64;

	/**
	 * Returns the evaluation result as a constant string if the
	 * kind is other than Int or float. User must not free this pointer,
	 * instead call clang_EvalResult_dispose on the CXEvalResult returned
	 * by clang_Cursor_Evaluate.
	 */
	@:native("clang_EvalResult_getAsStr")
	public static function EvalResult_getAsStr(E:CXEvalResult):String;

	/**
	 * Disposes the created Eval memory.
	 */
	@:native("clang_EvalResult_dispose")
	public static function EvalResult_dispose(E:CXEvalResult):Void;

	/**
	 * Retrieve the character data associated with the given string.
	 */
	@:native("clang_getCString")
	public static function getCString(s:CXString):String;

	/**
	 * Free the given string.
	 */
	@:native("clang_disposeString")
	public static function disposeString(s:CXString):Void;

	/**
	 * Free the given string set.
	 */
	@:native("clang_disposeStringSet")
	public static function disposeStringSet(s:CXStringSet):Void;

	/**
	 * Retrieve the kind of the given cursor.
	 */
	@:native("clang_getCursorKind")
	public static function getCursorKind(c:CXCursor):CXCursorKind;

	/**
	 * Determine whether the given cursor kind represents a declaration.
	 */
	@:native("clang_isDeclaration")
	public static function isDeclaration(k:CXCursorKind):Int;

	/* for debug/testing */
	@:native("clang_getCursorKindSpelling")
	public static function getCursorKindSpelling(c:CXCursorKind):CXString;

	/**
	 * Retrieve the type of a CXCursor (if any).
	 */
	public static function getCursorType(C:CXCursor):CXType;

	/**
	 * Pretty-print the underlying type using the rules of the
	 * language of the translation unit from which it came.
	 *
	 * If the type is invalid, an empty string is returned.
	 */
	@:native("clang_getTypeSpelling")
	public static function getTypeSpelling(c:CXType):CXString;

	/**
	 * Retrieve the spelling of a given CXTypeKind.
	 */
	@:native("clang_getTypeKindSpelling")
	public static function getTypeKindSpelling(k:CXTypeKind):CXString;

	/**
	 * Retrieve the return type associated with a function type.
	 *
	 * If a non-function type is passed in, an invalid type is returned.
	 */
	@:native("clang_getResultType")
	public static function getResultType(t:CXType):CXType;

	/**
	 * Returns the typedef name of the given type.
	 */
	@:native("clang_getTypedefName")
	public static function getTypedefName(CT:CXType):CXString;

	/**
	 * For pointer types, returns the type of the pointee.
	 */
	@:native("clang_getPointeeType")
	public static function getPointeeType(ct:CXType):CXType;

	/**
	 * Return the canonical type for a CXType.
	 *
	 * Clang's type system explicitly models typedefs and all the ways
	 * a specific type can be represented.  The canonical type is the underlying
	 * type with all the "sugar" removed.  For example, if 'T' is a typedef
	 * for 'int', the canonical type for 'T' would be 'int'.
	 */
	@:native("clang_getCanonicalType")
	public static function getCanonicalType(T:CXType):CXType;

	/**
	 * Retrieve the type named by the qualified-id.
	 *
	 * If a non-elaborated type is passed in, an invalid type is returned.
	 */
	@:native("clang_Type_getNamedType")
	public static function Type_getNamedType(T:CXType):CXType;

	/**
	 * Return the alignment of a type in bytes as per C++[expr.alignof]
	 *   standard.
	 *
	 * If the type declaration is invalid, CXTypeLayoutError_Invalid is returned.
	 * If the type declaration is an incomplete type, CXTypeLayoutError_Incomplete
	 *   is returned.
	 * If the type declaration is a dependent type, CXTypeLayoutError_Dependent is
	 *   returned.
	 * If the type declaration is not a constant size type,
	 *   CXTypeLayoutError_NotConstantSize is returned.
	 */
	@:native("clang_Type_getAlignOf")
	public static function Type_getAlignOf(T:CXType):Int64;

	/**
	 * Return the cursor for the declaration of the given type.
	 */
	@:native("clang_getTypeDeclaration")
	public static function getTypeDeclaration(T:CXType):CXCursor;

	/**
	 * Retrieve the underlying type of a typedef declaration.
	 *
	 * If the cursor does not reference a typedef declaration, an invalid type is
	 * returned.
	 */
	@:native("clang_getTypedefDeclUnderlyingType")
	public static function getTypedefDeclUnderlyingType(C:CXCursor):CXType;

	/**
	 * Retrieve a name for the entity referenced by this cursor.
	 */
	@:native("clang_getCursorSpelling")
	public static function getCursorSpelling(C:CXCursor):CXString;

	/**
	 * Retrieve the cursor that represents the given translation unit.
	 *
	 * The translation unit cursor can be used to start traversing the
	 * various declarations within the given translation unit.
	 */
	@:native("clang_getTranslationUnitCursor")
	public static function getTranslationUnitCursor(unit:CXTranslationUnit):CXCursor;

	/**
	 * Format the given diagnostic in a manner that is suitable for display.
	 *
	 * This routine will format the given diagnostic to a string, rendering
	 * the diagnostic according to the various options given. The
	 * \c clang_defaultDiagnosticDisplayOptions() function returns the set of
	 * options that most closely mimics the behavior of the clang compiler.
	 *
	 * @param Diagnostic The diagnostic to print.
	 *
	 * @param Options A set of options that control the diagnostic display,
	 * created by combining \c CXDiagnosticDisplayOptions values.
	 *
	 * @returns A new string containing for formatted diagnostic.
	 */
	@:native("clang_formatDiagnostic")
	public static function formatDiagnostic(Diagnostic:CXDiagnostic, Options:Int):CXString;

	/**
	 * Visit the children of a particular cursor.
	 *
	 * This function visits all the direct children of the given cursor,
	 * invoking the given \p visitor function with the cursors of each
	 * visited child. The traversal may be recursive, if the visitor returns
	 * \c CXChildVisit_Recurse. The traversal may also be ended prematurely, if
	 * the visitor returns \c CXChildVisit_Break.
	 *
	 * @param parent the cursor whose child may be visited. All kinds of
	 * cursors can be visited, including invalid cursors (which, by
	 * definition, have no children).
	 *
	 * @param visitor the visitor function that will be invoked for each
	 * child of \p parent.
	 *
	 * @param client_data pointer data supplied by the client, which will
	 * be passed to the visitor each time it is invoked.
	 *
	 * @returns a non-zero value if the traversal was terminated
	 * prematurely by the visitor returning \c CXChildVisit_Break.
	 */
	@:native("clang_visitChildren")
	public static function visitChildren(parent:CXCursor, visitor:CXCursorVisitor, data:CXClientData):Int;

	/**
	 * Retrieve the number of non-variadic arguments associated with a given
	 * cursor.
	 *
	 * The number of arguments can be determined for calls as well as for
	 * declarations of functions or methods. For other cursors -1 is returned.
	 */
	@:native("clang_Cursor_getNumArguments")
	public static function Cursor_getNumArguments(C:CXCursor):Int;

	/**
	 * Retrieve the argument cursor of a function or method.
	 *
	 * The argument cursor can be determined for calls as well as for declarations
	 * of functions or methods. For other cursors and for invalid indices, an
	 * invalid cursor is returned.
	 */
	@:native("clang_Cursor_getArgument")
	public static function Cursor_getArgument(C:CXCursor, i:Int):CXCursor;

	/**
	 * Retrieve the number of non-variadic parameters associated with a
	 * function type.
	 *
	 * If a non-function type is passed in, -1 is returned.
	 */
	@:native("clang_getNumArgTypes")
	public static function getNumArgTypes(T:CXType):Int;

	/**
	 * Retrieve the type of a parameter of a function type.
	 *
	 * If a non-function type is passed in or the function does not have enough
	 * parameters, an invalid type is returned.
	 */
	@:native("clang_getArgType")
	public static function getArgType(T:CXType, i:Int):CXType;

	/**
	 * Retrieve the integer value of an enum constant declaration as a signed
	 *  long long.
	 *
	 * If the cursor does not reference an enum constant declaration, LLONG_MIN is returned.
	 * Since this is also potentially a valid constant value, the kind of the cursor
	 * must be verified before calling this function.
	 */
	@:native("clang_getEnumConstantDeclValue")
	public static function getEnumConstantDeclValue(C:CXCursor):Int64;

	/**
	 * Determine whether two ranges are equivalent.
	 *
	 * \returns non-zero if the ranges are the same, zero if they differ.
	 */
	@:native("clang_equalRanges")
	public static function equalRanges(range1:CXSourceRange, range2:CXSourceRange):Int;

	/**
	 * Given a cursor that represents a declaration, return the associated
	 * comment's source range.  The range may include multiple consecutive comments
	 * with whitespace in between.
	 */
	@:native("clang_Cursor_getCommentRange")
	public static function Cursor_getCommentRange(C:CXCursor):CXSourceRange;

	/**
	 * Given a cursor that represents a declaration, return the associated
	 * comment text, including comment markers.
	 */
	@:native("clang_Cursor_getRawCommentText")
	public static function Cursor_getRawCommentText(C:CXCursor):CXString;

	/**
	 * Given a cursor that represents a documentable entity (e.g.,
	 * declaration), return the associated \paragraph; otherwise return the
	 * first paragraph.
	 */
	@:native("clang_Cursor_getBriefCommentText")
	public static function Cursor_getBriefCommentText(C:CXCursor):CXString;

	/**
	 * Retrieve the physical location of the source constructor referenced
	 * by the given cursor.
	 *
	 * The location of a declaration is typically the location of the name of that
	 * declaration, where the name of that declaration would occur if it is
	 * unnamed, or some keyword that introduces that particular declaration.
	 * The location of a reference is where that reference occurs within the
	 * source code.
	 */
	@:native("clang_getCursorLocation")
	public static function getCursorLocation(C:CXCursor):CXSourceLocation;

	/**
	 * Retrieve the file, line, column, and offset represented by
	 * the given source location.
	 *
	 * If the location refers into a macro expansion, return where the macro was
	 * expanded or where the macro argument was written, if the location points at
	 * a macro argument.
	 *
	 * @param location the location within a source file that will be decomposed
	 * into its parts.
	 *
	 * @param file [out] if non-NULL, will be set to the file to which the given
	 * source location points.
	 *
	 * @param line [out] if non-NULL, will be set to the line to which the given
	 * source location points.
	 *
	 * @param column [out] if non-NULL, will be set to the column to which the given
	 * source location points.
	 *
	 * @param offset [out] if non-NULL, will be set to the offset into the
	 * buffer to which the given source location points.
	 */
	@:native("clang_getFileLocation")
	public static function getFileLocation(location:CXSourceLocation, file:cpp.RawPointer<CXFile>, line:cpp.Pointer<Int>, column:cpp.Pointer<Int>,
		offset:cpp.Pointer<Int>):Void;

	/**
	 * Retrieve the complete file and path name of the given file.
	 */
	@:native("clang_getFileName")
	public static function getFileName(SFile:CXFile):CXString;

	/**
	 * Return the number of elements of an array or vector type.
	 *
	 * If a type is passed in that is not an array or vector type,
	 * -1 is returned.
	 */
	@:native("clang_getNumElements")
	public static function getNumElements(T:CXType):Int64;

	/**
	 * Return the element type of an array type.
	 *
	 * If a non-array type is passed in, an invalid type is returned.
	 */
	@:native("clang_getArrayElementType")
	public static function getArrayElementType(T:CXType):CXType;

	/**
	 * Determine whether a  CXCursor that is a macro, is
	 * function like.
	 */
	@:native("clang_Cursor_isMacroFunctionLike")
	public static function Cursor_isMacroFunctionLike(C:CXCursor):Int;

	/**
	 * Determine whether a  CXCursor that is a macro, is a
	 * builtin one.
	 */
	@:native("clang_Cursor_isMacroBuiltin")
	public static function Cursor_isMacroBuiltin(C:CXCursor):Int;

	/**
	 * If cursor is a statement declaration tries to evaluate the
	 * statement and if its variable, tries to evaluate its initializer,
	 * into its corresponding type.
	 */
	@:native("clang_Cursor_Evaluate")
	public static function Cursor_Evaluate(C:CXCursor):CXEvalResult;

	/**
	 * Determine whether the given cursor represents an anonymous
	 * tag or namespace
	 */
	@:native("clang_Cursor_isAnonymous")
	public static function Cursor_isAnonymous(C:CXCursor):Int;

	/**
	 * Determine whether the given cursor represents an anonymous record
	 * declaration.
	 */
	@:native("clang_Cursor_isAnonymousRecordDecl")
	public static function Cursor_isAnonymousRecordDecl(C:CXCursor):Int;

	/**
	 * Retrieve a Unified Symbol Resolution (USR) for the entity referenced
	 * by the given cursor.
	 *
	 * A Unified Symbol Resolution (USR) is a string that identifies a particular
	 * entity (function, class, variable, etc.) within a program. USRs can be
	 * compared across translation units to determine, e.g., when references in
	 * one translation refer to an entity defined in another translation unit.
	 */
	@:native("clang_getCursorUSR")
	public static function getCursorUSR(C:CXCursor):CXString;

	/**
	 * Retrieve the bit width of a bit field declaration as an integer.
	 *
	 * If a cursor that is not a bit field declaration is passed in, -1 is returned.
	 */
	@:native("clang_getFieldDeclBitWidth")
	public static function getFieldDeclBitWidth(C:CXCursor):Int;

	/**
	 * Determine whether a  CXCursor that is a function declaration, is an
	 * inline declaration.
	 */
	@:native("clang_Cursor_isFunctionInlined")
	public static function Cursor_isFunctionInlined(C:CXCursor):Int;

	/**
	 *  For a cursor that is either a reference to or a declaration
	 *  of some entity, retrieve a cursor that describes the definition of
	 *  that entity.
	 *
	 *  Some entities can be declared multiple times within a translation
	 *  unit, but only one of those declarations can also be a
	 *  definition. For example, given:
	 *
	 *  \code
	 *  int f(int, int);
	 *  int g(int x, int y) { return f(x, y); }
	 *  int f(int a, int b) { return a + b; }
	 *  int f(int, int);
	 *  \endcode
	 *
	 *  there are three declarations of the function "f", but only the
	 *  second one is a definition. The clang_getCursorDefinition()
	 *  function will take any cursor pointing to a declaration of "f"
	 *  (the first or fourth lines of the example) or a cursor referenced
	 *  that uses "f" (the call to "f' inside "g") and will return a
	 *  declaration cursor pointing to the definition (the second "f"
	 *  declaration).
	 *
	 *  If given a cursor for which there is no corresponding definition,
	 *  e.g., because there is no definition of that entity within this
	 *  translation unit, returns a NULL cursor.
	 */
	@:native("clang_getCursorDefinition")
	public static function clang_getCursorDefinition(C:CXCursor):CXCursor;

	/**
	 * Returns non-zero if \p cursor is null.
	 */
	@:native("clang_Cursor_isNull")
	public static function Cursor_isNull(c:CXCursor):Int;

	/**
	 * Determine whether the given cursor has any attributes.
	 */
	@:native("clang_Cursor_hasAttrs")
	public static function Cursor_hasAttrs(C:CXCursor):Int;

	/**
	 * Retrieves the base type of the ObjCObjectType.
	 *
	 * If the type is not an ObjC object, an invalid type is returned.
	 */
	@:native("clang_Type_getObjCObjectBaseType")
	public static function Type_getObjCObjectBaseType(T:CXType):CXType;

	/**
	 * Given a cursor that represents a property declaration, return the
	 * associated property attributes. The bits are formed from
	 * \c CXObjCPropertyAttrKind.
	 *
	 * \param reserved Reserved for future use, pass 0.
	 */
	@:native("clang_Cursor_getObjCPropertyAttributes")
	public static function Cursor_getObjCPropertyAttributes(C:CXCursor, reserved:Int):Int;

	/**
	 * Given a cursor that represents a property declaration, return the
	 * name of the method that implements the getter.
	 */
	@:native("clang_Cursor_getObjCPropertyGetterName")
	public static function Cursor_getObjCPropertyGetterName(C:CXCursor):CXString;

/**
 * Given a cursor that represents a property declaration, return the
 * name of the method that implements the setter, if any.
 */
 @:native("clang_Cursor_getObjCPropertySetterName")
 public static function  Cursor_getObjCPropertySetterName(C:CXCursor):CXString;
} // Clang
