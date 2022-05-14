package clang;

/**
 * Options to control the display of diagnostics.
 *
 * The values in this enum are meant to be combined to customize the
 * behavior of \c clang_formatDiagnostic().
 */
extern enum abstract CXDiagnosticDisplayOptions(Int) from Int to Int {
	/**
	 * Display the source-location information where the
	 * diagnostic was located.
	 *
	 * When set, diagnostics will be prefixed by the file, line, and
	 * (optionally) column to which the diagnostic refers. For example,
	 *
	 * \code
	 * test.c:28: warning: extra tokens at end of #endif directive
	 * \endcode
	 *
	 * This option corresponds to the clang flag \c -fshow-source-location.
	 */
	var CXDiagnostic_DisplaySourceLocation = 0x01;

	/**
	 * If displaying the source-location information of the
	 * diagnostic, also include the column number.
	 *
	 * This option corresponds to the clang flag \c -fshow-column.
	 */
	var CXDiagnostic_DisplayColumn = 0x02;

	/**
	 * If displaying the source-location information of the
	 * diagnostic, also include information about source ranges in a
	 * machine-parsable format.
	 *
	 * This option corresponds to the clang flag
	 * \c -fdiagnostics-print-source-range-info.
	 */
	var CXDiagnostic_DisplaySourceRanges = 0x04;

	/**
	 * Display the option name associated with this diagnostic, if any.
	 *
	 * The option name displayed (e.g., -Wconversion) will be placed in brackets
	 * after the diagnostic text. This option corresponds to the clang flag
	 * \c -fdiagnostics-show-option.
	 */
	var CXDiagnostic_DisplayOption = 0x08;

	/**
	 * Display the category number associated with this diagnostic, if any.
	 *
	 * The category number is displayed within brackets after the diagnostic text.
	 * This option corresponds to the clang flag
	 * \c -fdiagnostics-show-category=id.
	 */
	var CXDiagnostic_DisplayCategoryId = 0x10;

	/**
	 * Display the category name associated with this diagnostic, if any.
	 *
	 * The category name is displayed within brackets after the diagnostic text.
	 * This option corresponds to the clang flag
	 * \c -fdiagnostics-show-category=name.
	 */
	var CXDiagnostic_DisplayCategoryName = 0x20;
}
