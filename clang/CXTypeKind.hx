package clang;

/**
 * Describes the kind of type
 */
@:keep
@:structAccess
@:include('linc_clang.h')
@:native("CXTypeKind")
enum abstract CXTypeKind(Int) from Int to Int {
	/**
	 * Represents an invalid type (e.g., where no type is available).
	 */
	var CXType_Invalid = 0;

	/**
	 * A type whose specific kind is not exposed via this
	 * interface.
	 */
	var CXType_Unexposed = 1;

	/* Builtin types */
	var CXType_Void = 2;
	var CXType_Bool = 3;
	var CXType_Char_U = 4;
	var CXType_UChar = 5;
	var CXType_Char16 = 6;
	var CXType_Char32 = 7;
	var CXType_UShort = 8;
	var CXType_UInt = 9;
	var CXType_ULong = 10;
	var CXType_ULongLong = 11;
	var CXType_UInt128 = 12;
	var CXType_Char_S = 13;
	var CXType_SChar = 14;
	var CXType_WChar = 15;
	var CXType_Short = 16;
	var CXType_Int = 17;
	var CXType_Long = 18;
	var CXType_LongLong = 19;
	var CXType_Int128 = 20;
	var CXType_Float = 21;
	var CXType_Double = 22;
	var CXType_LongDouble = 23;
	var CXType_NullPtr = 24;
	var CXType_Overload = 25;
	var CXType_Dependent = 26;
	var CXType_ObjCId = 27;
	var CXType_ObjCClass = 28;
	var CXType_ObjCSel = 29;
	var CXType_Float128 = 30;
	var CXType_Half = 31;
	var CXType_Float16 = 32;
	var CXType_ShortAccum = 33;
	var CXType_Accum = 34;
	var CXType_LongAccum = 35;
	var CXType_UShortAccum = 36;
	var CXType_UAccum = 37;
	var CXType_ULongAccum = 38;
	var CXType_FirstBuiltin = CXType_Void;
	var CXType_LastBuiltin = CXType_ULongAccum;
	var CXType_Complex = 100;
	var CXType_Pointer = 101;
	var CXType_BlockPointer = 102;
	var CXType_LValueReference = 103;
	var CXType_RValueReference = 104;
	var CXType_Record = 105;
	var CXType_Enum = 106;
	var CXType_Typedef = 107;
	var CXType_ObjCInterface = 108;
	var CXType_ObjCObjectPointer = 109;
	var CXType_FunctionNoProto = 110;
	var CXType_FunctionProto = 111;
	var CXType_ConstantArray = 112;
	var CXType_Vector = 113;
	var CXType_IncompleteArray = 114;
	var CXType_VariableArray = 115;
	var CXType_DependentSizedArray = 116;
	var CXType_MemberPointer = 117;
	var CXType_Auto = 118;

	/**
	 * Represents a type that was referred to using an elaborated type keyword.
	 *
	 * E.g.; struct S; or via a qualified name; e.g.; N::M::type; or both.
	 */
	var CXType_Elaborated = 119;

	/* OpenCL PipeType. */
	var CXType_Pipe = 120;
	/* OpenCL builtin types. */
	var CXType_OCLImage1dRO = 121;
	var CXType_OCLImage1dArrayRO = 122;
	var CXType_OCLImage1dBufferRO = 123;
	var CXType_OCLImage2dRO = 124;
	var CXType_OCLImage2dArrayRO = 125;
	var CXType_OCLImage2dDepthRO = 126;
	var CXType_OCLImage2dArrayDepthRO = 127;
	var CXType_OCLImage2dMSAARO = 128;
	var CXType_OCLImage2dArrayMSAARO = 129;
	var CXType_OCLImage2dMSAADepthRO = 130;
	var CXType_OCLImage2dArrayMSAADepthRO = 131;
	var CXType_OCLImage3dRO = 132;
	var CXType_OCLImage1dWO = 133;
	var CXType_OCLImage1dArrayWO = 134;
	var CXType_OCLImage1dBufferWO = 135;
	var CXType_OCLImage2dWO = 136;
	var CXType_OCLImage2dArrayWO = 137;
	var CXType_OCLImage2dDepthWO = 138;
	var CXType_OCLImage2dArrayDepthWO = 139;
	var CXType_OCLImage2dMSAAWO = 140;
	var CXType_OCLImage2dArrayMSAAWO = 141;
	var CXType_OCLImage2dMSAADepthWO = 142;
	var CXType_OCLImage2dArrayMSAADepthWO = 143;
	var CXType_OCLImage3dWO = 144;
	var CXType_OCLImage1dRW = 145;
	var CXType_OCLImage1dArrayRW = 146;
	var CXType_OCLImage1dBufferRW = 147;
	var CXType_OCLImage2dRW = 148;
	var CXType_OCLImage2dArrayRW = 149;
	var CXType_OCLImage2dDepthRW = 150;
	var CXType_OCLImage2dArrayDepthRW = 151;
	var CXType_OCLImage2dMSAARW = 152;
	var CXType_OCLImage2dArrayMSAARW = 153;
	var CXType_OCLImage2dMSAADepthRW = 154;
	var CXType_OCLImage2dArrayMSAADepthRW = 155;
	var CXType_OCLImage3dRW = 156;
	var CXType_OCLSampler = 157;
	var CXType_OCLEvent = 158;
	var CXType_OCLQueue = 159;
	var CXType_OCLReserveID = 160;
	var CXType_ObjCObject = 161;
	var CXType_ObjCTypeParam = 162;
	var CXType_Attributed = 163;
	var CXType_OCLIntelSubgroupAVCMcePayload = 164;
	var CXType_OCLIntelSubgroupAVCImePayload = 165;
	var CXType_OCLIntelSubgroupAVCRefPayload = 166;
	var CXType_OCLIntelSubgroupAVCSicPayload = 167;
	var CXType_OCLIntelSubgroupAVCMceResult = 168;
	var CXType_OCLIntelSubgroupAVCImeResult = 169;
	var CXType_OCLIntelSubgroupAVCRefResult = 170;
	var CXType_OCLIntelSubgroupAVCSicResult = 171;
	var CXType_OCLIntelSubgroupAVCImeResultSingleRefStreamout = 172;
	var CXType_OCLIntelSubgroupAVCImeResultDualRefStreamout = 173;
	var CXType_OCLIntelSubgroupAVCImeSingleRefStreamin = 174;
	var CXType_OCLIntelSubgroupAVCImeDualRefStreamin = 175;
	var CXType_ExtVector = 176;
}
