# linc/libclang
This is a LINC based Haxe binding for LibClang, a stable high level C interface to clang.

For more information, see the [linc homepage](http://snowkit.github.io/linc/)


## Example 
```hx
class Test {
        
    static function main() {
        final index = Clang.createIndex(0, 0);
        final unit = Clang.parseTranslationUnit(index, "header.hpp", null, 0, null,0, CXTranslationUnit_None);
        if(unit == null){
            Sys.println("Unable to parse translation unit. Quitting.");
            Sys.exit(-1);
        }
        final cursor = Clang.getTranslationUnitCursor(unit);
        Clang.visitChildren(cursor, Callable.fromStaticFunction(visitor), null);
        Clang.disposeTranslationUnit(unit);
        Clang.disposeIndex(index);
    }

    static function visitor (c1:CXCursor, parent:CXCursor, data:CXClientData):CXChildVisitResult{
        Sys.println('Cursor kind: "${Clang.getCursorSpelling(c1).toString()}" of kind "${Clang.getCursorKindSpelling(Clang.getCursorKind(c1)).toString()}"');
        return CXChildVisit_Recurse;
    }

}
```