package clang;

/**
 * Opaque pointer representing client data that will be passed through
 * to various callbacks and visitors.
 */
typedef CXClientData = cpp.RawPointer<Void>;