class UnpQRParseError extends Error {
  final UnpQRParseErrorType type;

  UnpQRParseError(this.type);

  factory UnpQRParseError.invalidFormat() =>
      UnpQRParseError(UnpQRParseErrorType.invalidFormat);

  factory UnpQRParseError.tooLong() =>
      UnpQRParseError(UnpQRParseErrorType.tooLong);
}

enum UnpQRParseErrorType {
  invalidFormat,
  tooLong,
  missedAmount,
}
