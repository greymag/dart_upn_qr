class UnpQRParseError extends Error {
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

enum UnpQRParseErrorType {
  invalidFormat,
  tooLong,
  tooFewLines,
  tooManyLines,
  missedAmount,
  missedChecksum,
  invalidChecksumFormat,
  checksumNotMatched,
}
