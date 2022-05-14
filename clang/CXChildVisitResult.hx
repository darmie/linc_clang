package clang;

/**
 * Describes how the traversal of the children of a particular
 * cursor should proceed after visiting a particular child cursor.
 *
 * A value of this enumeration type should be returned by each
 * \c CXCursorVisitor to indicate how clang_visitChildren() proceed.
 */
 @:keep
 @:include('linc_clang.h')
 @:native("CXChildVisitResult")
 extern class ECXChildVisitResult {}
 
 extern enum abstract CXChildVisitResult(ECXChildVisitResult) {
     /**
      * Terminates the cursor traversal.
      */
     @:native("CXChildVisitResult::CXChildVisit_Break")
     final CXChildVisit_Break;
     /**
      * Continues the cursor traversal with the next sibling of
      * the cursor just visited, without visiting its children.
      */
      @:native("CXChildVisitResult::CXChildVisit_Continue")
     final CXChildVisit_Continue;
     /**
      * Recursively traverse the children of this cursor, using
      * the same visitor and client data.
      */
      @:native("CXChildVisitResult::CXChildVisit_Recurse")
     final CXChildVisit_Recurse;
 }