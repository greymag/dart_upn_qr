/// UPN QR parse error
class UnpQRParseError extends Error {
  /// Type
  final UnpQRParseErrorType type;

  UnpQRParseError(this.type);

  factory UnpQRParseError.invalidFormat() =>
      UnpQRParseError(UnpQRParseErrorType.invalidFormat);

  factory UnpQRParseError.tooLong() =>
      UnpQRParseError(UnpQRParseErrorType.tooLong);

  factory UnpQRParseError.tooFewLines() =>
      UnpQRParseError(UnpQRParseErrorType.tooFewLines);

  factory UnpQRParseError.tooManyLines() =>
      UnpQRParseError(UnpQRParseErrorType.tooManyLines);

  factory UnpQRParseError.invalidChecksumFormat() =>
      UnpQRParseError(UnpQRParseErrorType.invalidChecksumFormat);

  factory UnpQRParseError.checksumNotMatched() =>
      UnpQRParseError(UnpQRParseErrorType.checksumNotMatched);

  @override
  String toString() => 'UnpQRParseError(${type.name})';
}

/// UPN QR parse error type
enum UnpQRParseErrorType {
  /// Invalid format
  invalidFormat,

  /// Data is too long
  tooLong,

  /// Too few lines in the string data
  tooFewLines,

  /// Too many lines in the string data
  tooManyLines,

  /// There is no amount value in data
  missedAmount,

  /// There is no checksum value in data
  missedChecksum,

  /// Checksum format is invalid (not a correct number)
  invalidChecksumFormat,

  /// Checksum is not match.
  checksumNotMatched,
}
