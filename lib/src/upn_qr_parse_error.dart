class UnpQRParseError extends Error {
  final UnpQRParseErrorType type;

  UnpQRParseError(this.type);

  factory UnpQRParseError.invalidFormat() =>
      UnpQRParseError(UnpQRParseErrorType.invalidFormat);
}

enum UnpQRParseErrorType {
  invalidFormat,
  missedAmount,
}
