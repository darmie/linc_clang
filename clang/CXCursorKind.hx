package clang;


/**
 * Describes the kind of entity that a cursor refers to.
*/
@:keep
@:structAccess
@:include('linc_clang.h')
@:native("CXCursorKind")
extern enum abstract CXCursorKind(Int) from Int to Int {
      /* Declarations */
  /**
   * A declaration whose specific kind is not exposed via this
   * interface.
   *
   * Unexposed declarations have the same operations as any other kind
   * of declaration; one can extract their location information;
   * spelling, find their definitions, etc. However, the specific kind
   * of the declaration is not reported.
   */
  var CXCursor_UnexposedDecl                 = 1;
  /** A C or C++ struct. */
  var CXCursor_StructDecl                    = 2;
  /** A C or C++ union. */
  var CXCursor_UnionDecl                     = 3;
  /** A C++ class. */
  var CXCursor_ClassDecl                     = 4;
  /** An enumeration. */
  var CXCursor_EnumDecl                      = 5;
  /**
   * A field (in C) or non-static data member (in C++) in a
   * struct; union; or C++ class.
   */
  var CXCursor_FieldDecl                     = 6;
  /** An enumerator constant. */
  var CXCursor_EnumConstantDecl              = 7;
  /** A function. */
  var CXCursor_FunctionDecl                  = 8;
  /** A variable. */
  var CXCursor_VarDecl                       = 9;
  /** A function or method parameter. */
  var CXCursor_ParmDecl                      = 10;
  /** An Objective-C \@interface. */
  var CXCursor_ObjCInterfaceDecl             = 11;
  /** An Objective-C \@interface for a category. */
  var CXCursor_ObjCCategoryDecl              = 12;
  /** An Objective-C \@protocol declaration. */
  var CXCursor_ObjCProtocolDecl              = 13;
  /** An Objective-C \@property declaration. */
  var CXCursor_ObjCPropertyDecl              = 14;
  /** An Objective-C instance variable. */
  var CXCursor_ObjCIvarDecl                  = 15;
  /** An Objective-C instance method. */
  var CXCursor_ObjCInstanceMethodDecl        = 16;
  /** An Objective-C class method. */
  var CXCursor_ObjCClassMethodDecl           = 17;
  /** An Objective-C \@implementation. */
  var CXCursor_ObjCImplementationDecl        = 18;
  /** An Objective-C \@implementation for a category. */
  var CXCursor_ObjCCategoryImplDecl          = 19;
  /** A typedef. */
  var CXCursor_TypedefDecl                   = 20;
  /** A C++ class method. */
  var CXCursor_CXXMethod                     = 21;
  /** A C++ namespace. */
  var CXCursor_Namespace                     = 22;
  /** A linkage specification; e.g. 'extern "C"'. */
  var CXCursor_LinkageSpec                   = 23;
  /** A C++ constructor. */
  var CXCursor_Constructor                   = 24;
  /** A C++ destructor. */
  var CXCursor_Destructor                    = 25;
  /** A C++ conversion function. */
  var CXCursor_ConversionFunction            = 26;
  /** A C++ template type parameter. */
  var CXCursor_TemplateTypeParameter         = 27;
  /** A C++ non-type template parameter. */
  var CXCursor_NonTypeTemplateParameter      = 28;
  /** A C++ template template parameter. */
  var CXCursor_TemplateTemplateParameter     = 29;
  /** A C++ function template. */
  var CXCursor_FunctionTemplate              = 30;
  /** A C++ class template. */
  var CXCursor_ClassTemplate                 = 31;
  /** A C++ class template partial specialization. */
  var CXCursor_ClassTemplatePartialSpecialization = 32;
  /** A C++ namespace alias declaration. */
  var CXCursor_NamespaceAlias                = 33;
  /** A C++ using directive. */
  var CXCursor_UsingDirective                = 34;
  /** A C++ using declaration. */
  var CXCursor_UsingDeclaration              = 35;
  /** A C++ alias declaration */
  var CXCursor_TypeAliasDecl                 = 36;
  /** An Objective-C \@synthesize definition. */
  var CXCursor_ObjCSynthesizeDecl            = 37;
  /** An Objective-C \@dynamic definition. */
  var CXCursor_ObjCDynamicDecl               = 38;
  /** An access specifier. */
  var CXCursor_CXXAccessSpecifier            = 39;

  var CXCursor_FirstDecl                     = CXCursor_UnexposedDecl;
  var CXCursor_LastDecl                      = CXCursor_CXXAccessSpecifier;

  /* References */
  var CXCursor_FirstRef                      = 40; /* Decl references */
  var CXCursor_ObjCSuperClassRef             = 40;
  var CXCursor_ObjCProtocolRef               = 41;
  var CXCursor_ObjCClassRef                  = 42;
  /**
   * A reference to a type declaration.
   *
   * A type reference occurs anywhere where a type is named but not
   * declared. For example, given:
   *
   * \code
   * typedef unsigned size_type;
   * size_type size;
   * \endcode
   *
   * The typedef is a declaration of size_type (var CXCursor_TypedefDecl);
   * while the type of the variable "size" is referenced. The cursor
   * referenced by the type of size is the typedef for size_type.
   */
  var CXCursor_TypeRef                       = 43;
  var CXCursor_CXXBaseSpecifier              = 44;
  /**
   * A reference to a class template; function template; template
   * template parameter, or class template partial specialization.
   */
  var CXCursor_TemplateRef                   = 45;
  /**
   * A reference to a namespace or namespace alias.
   */
  var CXCursor_NamespaceRef                  = 46;
  /**
   * A reference to a member of a struct; union; or class that occurs in
   * some non-expression context, e.g., a designated initializer.
   */
  var CXCursor_MemberRef                     = 47;
  /**
   * A reference to a labeled statement.
   *
   * This cursor kind is used to describe the jump to "start_over" in the
   * goto statement in the following example:
   *
   * \code
   *   start_over:
   *     ++counter;
   *
   *     goto start_over;
   * \endcode
   *
   * A label reference cursor refers to a label statement.
   */
  var CXCursor_LabelRef                      = 48;

  /**
   * A reference to a set of overloaded functions or function templates
   * that has not yet been resolved to a specific function or function template.
   *
   * An overloaded declaration reference cursor occurs in C++ templates where
   * a dependent name refers to a function. For example:
   *
   * \code
   * template<typename T> void swap(T&; T&);
   *
   * struct X { ... };
   * void swap(X&; X&);
   *
   * template<typename T>
   * void reverse(T* first; T* last) {
   *   while (first < last - 1) {
   *     swap(*first; *--last);
   *     ++first;
   *   }
   * }
   *
   * struct Y { };
   * void swap(Y&; Y&);
   * \endcode
   *
   * Here; the identifier "swap" is associated with an overloaded declaration
   * reference. In the template definition; "swap" refers to either of the two
   * "swap" functions declared above, so both results will be available. At
   * instantiation time; "swap" may also refer to other functions found via
   * argument-dependent lookup (e.g., the "swap" function at the end of the
   * example).
   *
   * The functions \c clang_getNumOverloadedDecls() and
   * \c clang_getOverloadedDecl() can be used to retrieve the definitions
   * referenced by this cursor.
   */
  var CXCursor_OverloadedDeclRef             = 49;

  /**
   * A reference to a variable that occurs in some non-expression
   * context; e.g.; a C++ lambda capture list.
   */
  var CXCursor_VariableRef                   = 50;

  var CXCursor_LastRef                       = CXCursor_VariableRef;

  /* Error conditions */
  var CXCursor_FirstInvalid                  = 70;
  var CXCursor_InvalidFile                   = 70;
  var CXCursor_NoDeclFound                   = 71;
  var CXCursor_NotImplemented                = 72;
  var CXCursor_InvalidCode                   = 73;
  var CXCursor_LastInvalid                   = CXCursor_InvalidCode;

  /* Expressions */
  var CXCursor_FirstExpr                     = 100;

  /**
   * An expression whose specific kind is not exposed via this
   * interface.
   *
   * Unexposed expressions have the same operations as any other kind
   * of expression; one can extract their location information;
   * spelling; children; etc. However; the specific kind of the
   * expression is not reported.
   */
  var CXCursor_UnexposedExpr                 = 100;

  /**
   * An expression that refers to some value declaration; such
   * as a function; variable; or enumerator.
   */
  var CXCursor_DeclRefExpr                   = 101;

  /**
   * An expression that refers to a member of a struct; union;
   * class; Objective-C class; etc.
   */
  var CXCursor_MemberRefExpr                 = 102;

  /** An expression that calls a function. */
  var CXCursor_CallExpr                      = 103;

  /** An expression that sends a message to an Objective-C
   object or class. */
  var CXCursor_ObjCMessageExpr               = 104;

  /** An expression that represents a block literal. */
  var CXCursor_BlockExpr                     = 105;

  /** An integer literal.
   */
  var CXCursor_IntegerLiteral                = 106;

  /** A floating point number literal.
   */
  var CXCursor_FloatingLiteral               = 107;

  /** An imaginary number literal.
   */
  var CXCursor_ImaginaryLiteral              = 108;

  /** A string literal.
   */
  var CXCursor_StringLiteral                 = 109;

  /** A character literal.
   */
  var CXCursor_CharacterLiteral              = 110;

  /** A parenthesized expression; e.g. "(1)".
   *
   * This AST node is only formed if full location information is requested.
   */
  var CXCursor_ParenExpr                     = 111;

  /** This represents the unary-expression's (except sizeof and
   * alignof).
   */
  var CXCursor_UnaryOperator                 = 112;

  /** [C99 6.5.2.1] Array Subscripting.
   */
  var CXCursor_ArraySubscriptExpr            = 113;

  /** A builtin binary operation expression such as "x + y" or
   * "x <= y".
   */
  var CXCursor_BinaryOperator                = 114;

  /** Compound assignment such as "+=".
   */
  var CXCursor_CompoundAssignOperator        = 115;

  /** The ?: ternary operator.
   */
  var CXCursor_ConditionalOperator           = 116;

  /** An explicit cast in C (C99 6.5.4) or a C-style cast in C++
   * (C++ [expr.cast]); which uses the syntax (Type)expr.
   *
   * For example: (int)f.
   */
  var CXCursor_CStyleCastExpr                = 117;

  /** [C99 6.5.2.5]
   */
  var CXCursor_CompoundLiteralExpr           = 118;

  /** Describes an C or C++ initializer list.
   */
  var CXCursor_InitListExpr                  = 119;

  /** The GNU address of label extension; representing &&label.
   */
  var CXCursor_AddrLabelExpr                 = 120;

  /** This is the GNU Statement Expression extension: ({int X=4; X;})
   */
  var CXCursor_StmtExpr                      = 121;

  /** Represents a C11 generic selection.
   */
  var CXCursor_GenericSelectionExpr          = 122;

  /** Implements the GNU __null extension; which is a name for a null
   * pointer constant that has integral type (e.g.; int or long) and is the same
   * size and alignment as a pointer.
   *
   * The __null extension is typically only used by system headers; which define
   * NULL as __null in C++ rather than using 0 (which is an integer that may not
   * match the size of a pointer).
   */
  var CXCursor_GNUNullExpr                   = 123;

  /** C++'s static_cast<> expression.
   */
  var CXCursor_CXXStaticCastExpr             = 124;

  /** C++'s dynamic_cast<> expression.
   */
  var CXCursor_CXXDynamicCastExpr            = 125;

  /** C++'s reinterpret_cast<> expression.
   */
  var CXCursor_CXXReinterpretCastExpr        = 126;

  /** C++'s const_cast<> expression.
   */
  var CXCursor_CXXConstCastExpr              = 127;

  /** Represents an explicit C++ type conversion that uses "functional"
   * notion (C++ [expr.type.conv]).
   *
   * Example:
   * \code
   *   x = int(0.5);
   * \endcode
   */
  var CXCursor_CXXFunctionalCastExpr         = 128;

  /** A C++ typeid expression (C++ [expr.typeid]).
   */
  var CXCursor_CXXTypeidExpr                 = 129;

  /** [C++ 2.13.5] C++ Boolean Literal.
   */
  var CXCursor_CXXBoolLiteralExpr            = 130;

  /** [C++0x 2.14.7] C++ Pointer Literal.
   */
  var CXCursor_CXXNullPtrLiteralExpr         = 131;

  /** Represents the "this" expression in C++
   */
  var CXCursor_CXXThisExpr                   = 132;

  /** [C++ 15] C++ Throw Expression.
   *
   * This handles 'throw' and 'throw' assignment-expression. When
   * assignment-expression isn't present; Op will be null.
   */
  var CXCursor_CXXThrowExpr                  = 133;

  /** A new expression for memory allocation and constructor calls; e.g:
   * "new CXXNewExpr(foo)".
   */
  var CXCursor_CXXNewExpr                    = 134;

  /** A delete expression for memory deallocation and destructor calls;
   * e.g. "delete[] pArray".
   */
  var CXCursor_CXXDeleteExpr                 = 135;

  /** A unary expression. (noexcept; sizeof; or other traits)
   */
  var CXCursor_UnaryExpr                     = 136;

  /** An Objective-C string literal i.e. @"foo".
   */
  var CXCursor_ObjCStringLiteral             = 137;

  /** An Objective-C \@encode expression.
   */
  var CXCursor_ObjCEncodeExpr                = 138;

  /** An Objective-C \@selector expression.
   */
  var CXCursor_ObjCSelectorExpr              = 139;

  /** An Objective-C \@protocol expression.
   */
  var CXCursor_ObjCProtocolExpr              = 140;

  /** An Objective-C "bridged" cast expression; which casts between
   * Objective-C pointers and C pointers; transferring ownership in the process.
   *
   * \code
   *   NSString *str = (__bridge_transfer NSString *)CFCreateString();
   * \endcode
   */
  var CXCursor_ObjCBridgedCastExpr           = 141;

  /** Represents a C++0x pack expansion that produces a sequence of
   * expressions.
   *
   * A pack expansion expression contains a pattern (which itself is an
   * expression) followed by an ellipsis. For example:
   *
   * \code
   * template<typename F; typename ...Types>
   * void forward(F f; Types &&...args) {
   *  f(static_cast<Types&&>(args)...);
   * }
   * \endcode
   */
  var CXCursor_PackExpansionExpr             = 142;

  /** Represents an expression that computes the length of a parameter
   * pack.
   *
   * \code
   * template<typename ...Types>
   * struct count {
   *   static const unsigned value = sizeof...(Types);
   * };
   * \endcode
   */
  var CXCursor_SizeOfPackExpr                = 143;

  /* Represents a C++ lambda expression that produces a local function
   * object.
   *
   * \code
   * void abssort(float *x; unsigned N) {
   *   std::sort(x; x + N;
   *             [](float a; float b) {
   *               return std::abs(a) < std::abs(b);
   *             });
   * }
   * \endcode
   */
  var CXCursor_LambdaExpr                    = 144;

  /** Objective-c Boolean Literal.
   */
  var CXCursor_ObjCBoolLiteralExpr           = 145;

  /** Represents the "self" expression in an Objective-C method.
   */
  var CXCursor_ObjCSelfExpr                  = 146;

  /** OpenMP 4.0 [2.4; Array Section].
   */
  var CXCursor_OMPArraySectionExpr           = 147;

  /** Represents an @available(...) check.
   */
  var CXCursor_ObjCAvailabilityCheckExpr     = 148;

  /**
   * Fixed point literal
   */
  var CXCursor_FixedPointLiteral             = 149;

  var CXCursor_LastExpr                      = CXCursor_FixedPointLiteral;

  /* Statements */
  var CXCursor_FirstStmt                     = 200;
  /**
   * A statement whose specific kind is not exposed via this
   * interface.
   *
   * Unexposed statements have the same operations as any other kind of
   * statement; one can extract their location information; spelling;
   * children; etc. However; the specific kind of the statement is not
   * reported.
   */
  var CXCursor_UnexposedStmt                 = 200;

  /** A labelled statement in a function.
   *
   * This cursor kind is used to describe the "start_over:" label statement in
   * the following example:
   *
   * \code
   *   start_over:
   *     ++counter;
   * \endcode
   *
   */
  var CXCursor_LabelStmt                     = 201;

  /** A group of statements like { stmt stmt }.
   *
   * This cursor kind is used to describe compound statements; e.g. function
   * bodies.
   */
  var CXCursor_CompoundStmt                  = 202;

  /** A case statement.
   */
  var CXCursor_CaseStmt                      = 203;

  /** A default statement.
   */
  var CXCursor_DefaultStmt                   = 204;

  /** An if statement
   */
  var CXCursor_IfStmt                        = 205;

  /** A switch statement.
   */
  var CXCursor_SwitchStmt                    = 206;

  /** A while statement.
   */
  var CXCursor_WhileStmt                     = 207;

  /** A do statement.
   */
  var CXCursor_DoStmt                        = 208;

  /** A for statement.
   */
  var CXCursor_ForStmt                       = 209;

  /** A goto statement.
   */
  var CXCursor_GotoStmt                      = 210;

  /** An indirect goto statement.
   */
  var CXCursor_IndirectGotoStmt              = 211;

  /** A continue statement.
   */
  var CXCursor_ContinueStmt                  = 212;

  /** A break statement.
   */
  var CXCursor_BreakStmt                     = 213;

  /** A return statement.
   */
  var CXCursor_ReturnStmt                    = 214;

  /** A GCC inline assembly statement extension.
   */
  var CXCursor_GCCAsmStmt                    = 215;
  var CXCursor_AsmStmt                       = CXCursor_GCCAsmStmt;

  /** Objective-C's overall \@try-\@catch-\@finally statement.
   */
  var CXCursor_ObjCAtTryStmt                 = 216;

  /** Objective-C's \@catch statement.
   */
  var CXCursor_ObjCAtCatchStmt               = 217;

  /** Objective-C's \@finally statement.
   */
  var CXCursor_ObjCAtFinallyStmt             = 218;

  /** Objective-C's \@throw statement.
   */
  var CXCursor_ObjCAtThrowStmt               = 219;

  /** Objective-C's \@synchronized statement.
   */
  var CXCursor_ObjCAtSynchronizedStmt        = 220;

  /** Objective-C's autorelease pool statement.
   */
  var CXCursor_ObjCAutoreleasePoolStmt       = 221;

  /** Objective-C's collection statement.
   */
  var CXCursor_ObjCForCollectionStmt         = 222;

  /** C++'s catch statement.
   */
  var CXCursor_CXXCatchStmt                  = 223;

  /** C++'s try statement.
   */
  var CXCursor_CXXTryStmt                    = 224;

  /** C++'s for (* : *) statement.
   */
  var CXCursor_CXXForRangeStmt               = 225;

  /** Windows Structured Exception Handling's try statement.
   */
  var CXCursor_SEHTryStmt                    = 226;

  /** Windows Structured Exception Handling's except statement.
   */
  var CXCursor_SEHExceptStmt                 = 227;

  /** Windows Structured Exception Handling's finally statement.
   */
  var CXCursor_SEHFinallyStmt                = 228;

  /** A MS inline assembly statement extension.
   */
  var CXCursor_MSAsmStmt                     = 229;

  /** The null statement ";": C99 6.8.3p3.
   *
   * This cursor kind is used to describe the null statement.
   */
  var CXCursor_NullStmt                      = 230;

  /** Adaptor class for mixing declarations with statements and
   * expressions.
   */
  var CXCursor_DeclStmt                      = 231;

  /** OpenMP parallel directive.
   */
  var CXCursor_OMPParallelDirective          = 232;

  /** OpenMP SIMD directive.
   */
  var CXCursor_OMPSimdDirective              = 233;

  /** OpenMP for directive.
   */
  var CXCursor_OMPForDirective               = 234;

  /** OpenMP sections directive.
   */
  var CXCursor_OMPSectionsDirective          = 235;

  /** OpenMP section directive.
   */
  var CXCursor_OMPSectionDirective           = 236;

  /** OpenMP single directive.
   */
  var CXCursor_OMPSingleDirective            = 237;

  /** OpenMP parallel for directive.
   */
  var CXCursor_OMPParallelForDirective       = 238;

  /** OpenMP parallel sections directive.
   */
  var CXCursor_OMPParallelSectionsDirective  = 239;

  /** OpenMP task directive.
   */
  var CXCursor_OMPTaskDirective              = 240;

  /** OpenMP master directive.
   */
  var CXCursor_OMPMasterDirective            = 241;

  /** OpenMP critical directive.
   */
  var CXCursor_OMPCriticalDirective          = 242;

  /** OpenMP taskyield directive.
   */
  var CXCursor_OMPTaskyieldDirective         = 243;

  /** OpenMP barrier directive.
   */
  var CXCursor_OMPBarrierDirective           = 244;

  /** OpenMP taskwait directive.
   */
  var CXCursor_OMPTaskwaitDirective          = 245;

  /** OpenMP flush directive.
   */
  var CXCursor_OMPFlushDirective             = 246;

  /** Windows Structured Exception Handling's leave statement.
   */
  var CXCursor_SEHLeaveStmt                  = 247;

  /** OpenMP ordered directive.
   */
  var CXCursor_OMPOrderedDirective           = 248;

  /** OpenMP atomic directive.
   */
  var CXCursor_OMPAtomicDirective            = 249;

  /** OpenMP for SIMD directive.
   */
  var CXCursor_OMPForSimdDirective           = 250;

  /** OpenMP parallel for SIMD directive.
   */
  var CXCursor_OMPParallelForSimdDirective   = 251;

  /** OpenMP target directive.
   */
  var CXCursor_OMPTargetDirective            = 252;

  /** OpenMP teams directive.
   */
  var CXCursor_OMPTeamsDirective             = 253;

  /** OpenMP taskgroup directive.
   */
  var CXCursor_OMPTaskgroupDirective         = 254;

  /** OpenMP cancellation point directive.
   */
  var CXCursor_OMPCancellationPointDirective = 255;

  /** OpenMP cancel directive.
   */
  var CXCursor_OMPCancelDirective            = 256;

  /** OpenMP target data directive.
   */
  var CXCursor_OMPTargetDataDirective        = 257;

  /** OpenMP taskloop directive.
   */
  var CXCursor_OMPTaskLoopDirective          = 258;

  /** OpenMP taskloop simd directive.
   */
  var CXCursor_OMPTaskLoopSimdDirective      = 259;

  /** OpenMP distribute directive.
   */
  var CXCursor_OMPDistributeDirective        = 260;

  /** OpenMP target enter data directive.
   */
  var CXCursor_OMPTargetEnterDataDirective   = 261;

  /** OpenMP target exit data directive.
   */
  var CXCursor_OMPTargetExitDataDirective    = 262;

  /** OpenMP target parallel directive.
   */
  var CXCursor_OMPTargetParallelDirective    = 263;

  /** OpenMP target parallel for directive.
   */
  var CXCursor_OMPTargetParallelForDirective = 264;

  /** OpenMP target update directive.
   */
  var CXCursor_OMPTargetUpdateDirective      = 265;

  /** OpenMP distribute parallel for directive.
   */
  var CXCursor_OMPDistributeParallelForDirective = 266;

  /** OpenMP distribute parallel for simd directive.
   */
  var CXCursor_OMPDistributeParallelForSimdDirective = 267;

  /** OpenMP distribute simd directive.
   */
  var CXCursor_OMPDistributeSimdDirective = 268;

  /** OpenMP target parallel for simd directive.
   */
  var CXCursor_OMPTargetParallelForSimdDirective = 269;

  /** OpenMP target simd directive.
   */
  var CXCursor_OMPTargetSimdDirective = 270;

  /** OpenMP teams distribute directive.
   */
  var CXCursor_OMPTeamsDistributeDirective = 271;

  /** OpenMP teams distribute simd directive.
   */
  var CXCursor_OMPTeamsDistributeSimdDirective = 272;

  /** OpenMP teams distribute parallel for simd directive.
   */
  var CXCursor_OMPTeamsDistributeParallelForSimdDirective = 273;

  /** OpenMP teams distribute parallel for directive.
   */
  var CXCursor_OMPTeamsDistributeParallelForDirective = 274;

  /** OpenMP target teams directive.
   */
  var CXCursor_OMPTargetTeamsDirective = 275;

  /** OpenMP target teams distribute directive.
   */
  var CXCursor_OMPTargetTeamsDistributeDirective = 276;

  /** OpenMP target teams distribute parallel for directive.
   */
  var CXCursor_OMPTargetTeamsDistributeParallelForDirective = 277;

  /** OpenMP target teams distribute parallel for simd directive.
   */
  var CXCursor_OMPTargetTeamsDistributeParallelForSimdDirective = 278;

  /** OpenMP target teams distribute simd directive.
   */
  var CXCursor_OMPTargetTeamsDistributeSimdDirective = 279;

  /** C++2a std::bit_cast expression.
   */
  var CXCursor_BuiltinBitCastExpr = 280;

  /** OpenMP master taskloop directive.
   */
  var CXCursor_OMPMasterTaskLoopDirective = 281;

  /** OpenMP parallel master taskloop directive.
   */
  var CXCursor_OMPParallelMasterTaskLoopDirective = 282;

  /** OpenMP master taskloop simd directive.
   */
  var CXCursor_OMPMasterTaskLoopSimdDirective      = 283;

  /** OpenMP parallel master taskloop simd directive.
   */
  var CXCursor_OMPParallelMasterTaskLoopSimdDirective      = 284;

  /** OpenMP parallel master directive.
   */
  var CXCursor_OMPParallelMasterDirective      = 285;

  var CXCursor_LastStmt = CXCursor_OMPParallelMasterDirective;

  /**
   * Cursor that represents the translation unit itself.
   *
   * The translation unit cursor exists primarily to act as the root
   * cursor for traversing the contents of a translation unit.
   */
  var CXCursor_TranslationUnit               = 300;

  /* Attributes */
  var CXCursor_FirstAttr                     = 400;
  /**
   * An attribute whose specific kind is not exposed via this
   * interface.
   */
  var CXCursor_UnexposedAttr                 = 400;

  var CXCursor_IBActionAttr                  = 401;
  var CXCursor_IBOutletAttr                  = 402;
  var CXCursor_IBOutletCollectionAttr        = 403;
  var CXCursor_CXXFinalAttr                  = 404;
  var CXCursor_CXXOverrideAttr               = 405;
  var CXCursor_AnnotateAttr                  = 406;
  var CXCursor_AsmLabelAttr                  = 407;
  var CXCursor_PackedAttr                    = 408;
  var CXCursor_PureAttr                      = 409;
  var CXCursor_ConstAttr                     = 410;
  var CXCursor_NoDuplicateAttr               = 411;
  var CXCursor_CUDAConstantAttr              = 412;
  var CXCursor_CUDADeviceAttr                = 413;
  var CXCursor_CUDAGlobalAttr                = 414;
  var CXCursor_CUDAHostAttr                  = 415;
  var CXCursor_CUDASharedAttr                = 416;
  var CXCursor_VisibilityAttr                = 417;
  var CXCursor_DLLExport                     = 418;
  var CXCursor_DLLImport                     = 419;
  var CXCursor_NSReturnsRetained             = 420;
  var CXCursor_NSReturnsNotRetained          = 421;
  var CXCursor_NSReturnsAutoreleased         = 422;
  var CXCursor_NSConsumesSelf                = 423;
  var CXCursor_NSConsumed                    = 424;
  var CXCursor_ObjCException                 = 425;
  var CXCursor_ObjCNSObject                  = 426;
  var CXCursor_ObjCIndependentClass          = 427;
  var CXCursor_ObjCPreciseLifetime           = 428;
  var CXCursor_ObjCReturnsInnerPointer       = 429;
  var CXCursor_ObjCRequiresSuper             = 430;
  var CXCursor_ObjCRootClass                 = 431;
  var CXCursor_ObjCSubclassingRestricted     = 432;
  var CXCursor_ObjCExplicitProtocolImpl      = 433;
  var CXCursor_ObjCDesignatedInitializer     = 434;
  var CXCursor_ObjCRuntimeVisible            = 435;
  var CXCursor_ObjCBoxable                   = 436;
  var CXCursor_FlagEnum                      = 437;
  var CXCursor_ConvergentAttr                = 438;
  var CXCursor_WarnUnusedAttr                = 439;
  var CXCursor_WarnUnusedResultAttr          = 440;
  var CXCursor_AlignedAttr                   = 441;
  var CXCursor_LastAttr                      = CXCursor_AlignedAttr;

  /* Preprocessing */
  var CXCursor_PreprocessingDirective        = 500;
  var CXCursor_MacroDefinition               = 501;
  var CXCursor_MacroExpansion                = 502;
  var CXCursor_MacroInstantiation            = CXCursor_MacroExpansion;
  var CXCursor_InclusionDirective            = 503;
  var CXCursor_FirstPreprocessing            = CXCursor_PreprocessingDirective;
  var CXCursor_LastPreprocessing             = CXCursor_InclusionDirective;

  /* Extra Declarations */
  /**
   * A module import declaration.
   */
  var CXCursor_ModuleImportDecl              = 600;
  var CXCursor_TypeAliasTemplateDecl         = 601;
  /**
   * A static_assert or _Static_assert node
   */
  var CXCursor_StaticAssert                  = 602;
  /**
   * a friend declaration.
   */
  var CXCursor_FriendDecl                    = 603;
  var CXCursor_FirstExtraDecl                = CXCursor_ModuleImportDecl;
  var CXCursor_LastExtraDecl                 = CXCursor_FriendDecl;

  /**
   * A code completion overload candidate.
   */
  var CXCursor_OverloadCandidate             = 700;
}