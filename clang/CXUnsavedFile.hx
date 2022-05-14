package clang;


/**
 * Provides the contents of a file that has not yet been saved to disk.
 *
 * Each CXUnsavedFile instance provides the name of a file on the
 * system along with the current contents of that file that have not
 * yet been saved to disk.
 */
@:keep
@:structAccess
@:include('linc_clang.h')
@:native("CXUnsavedFile")
extern class CXUnsavedFile {
    public var Filename:String;
    public var Contents:String;
    public var Length:Int;
}