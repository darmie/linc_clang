package clang;

/**
 * An "index" that consists of a set of translation units that would
 * typically be linked together into an executable or library.
 */
typedef CXIndex = cpp.RawPointer<Void>;