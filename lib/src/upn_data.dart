class UpnData {
  /// Payer’s IBAN
  ///
  /// SEPA IBAN without spaces.
  ///
  /// Example: SI56020170014356205
  final String? payerIban;

  /// Deposit
  ///
  /// `true` if payment is deposit.
  ///
  /// Both [deposit] and [withdrawal] can be `false`, if not defined.
  final bool deposit;

  /// Withdrawal
  ///
  /// `true` if payment is withdrawal.
  ///
  /// Both [deposit] and [withdrawal] can be `false`, if not defined.
  final bool withdrawal;

  /// Payer’s reference
  ///
  /// Model and reference together without spaces.
  ///
  /// First 4 characters - SI or RF model rules.
  /// Next 22 characters - Rules for SI or RF reference (without spaces).
  ///
  /// Example: SI00225268-32526-222
  final String? payerReference;

  /// Payer’s name
  ///
  /// All characters of the ISO 8859-2 code table.
  /// No leading or following spaces.
  ///
  /// Example: Any company Ltd.
  final String? payerName;

  /// Payer’s street and No.
  ///
  /// All characters of the ISO 8859-2 code table.
  /// No leading or following spaces.
  ///
  /// Example: Lepa cesta 10
  final String? payerAddress;

  /// Payer’s city
  ///
  /// All characters of the ISO 8859-2 code table.
  /// No leading or following spaces..
  ///
  /// Example: 2000 Maribor
  final String? payerCity;

  /// Amount.
  ///
  /// Just numbers with leading zeros.
  /// Amount multiplied by 100 and without prefix or decimal places.
  /// The maximum amount hat can be entered is
  /// 999,999,999,999.99 (one billion - 1).
  /// If 0, the content is "00000000000"
  ///
  /// Example: 00000126874 (for 1.268,74).
  final String amount;

  /// Payment date
  ///
  /// Format 'DD.MM.YYYY'.
  ///
  /// Example: 11.07.2016
  final String? paymentDate;

  /// Urgent,
  ///
  /// `true` if payment if urgent.
  ///
  /// Example:
  final bool urgent;

  /// Purpose code.
  ///
  /// Uppercase letters (A-Z). Purpose code rules.
  ///
  /// 4 characters length.
  ///
  /// Example: CPYR
  final String? paymentPurposeCode;

  /// Purpose of payment
  ///
  /// All characters of the ISO 8859-2 code table.
  /// No leading or following spaces.
  ///
  /// Example: Invoice payment 18/2016.
  final String? paymentPurpose;

  /// Payment deadline
  ///
  /// Format 'DD.MM.YYYY'.
  ///
  /// Example: 11.07.2016
  final String? paymentDeadline;

  /// Recipient’s IBAN
  ///
  /// SEPA IBAN without spaces.
  ///
  /// Example: SI56020360253863406
  final String? recipientIban;

  /// Recipient’s reference
  ///
  /// Model and reference together without spaces.
  ///
  /// First 4 characters - SI or RF model rules.
  /// Next 22 characters - Rules for SI or RF reference (without spaces).
  ///
  /// Example: SI081236-17-345679
  final String? recipientReference;

  /// Recipient’s name
  ///
  /// All characters of the ISO 8859-2 code table.
  /// No leading or following spaces.
  ///
  /// Example: Bank Association of Slovenia - GIZ
  final String? recipientName;

  /// Recipient’s street and No.
  ///
  /// All characters of the ISO 8859-2 code table.
  /// No leading or following spaces.
  ///
  /// Example: Šubičeva 2
  final String? recipientAddress;

  /// Recipient’s city
  ///
  /// Post code and the city.
  ///
  /// All characters of the ISO 8859-2 code table.
  /// No leading or following spaces..
  ///
  /// Example: 1000 Ljubljana
  final String? recipientCity;

  UpnData({
    required this.payerIban,
    required this.deposit,
    required this.withdrawal,
    required this.payerReference,
    required this.payerName,
    required this.payerAddress,
    required this.payerCity,
    required this.amount,
    required this.paymentDate,
    required this.urgent,
    required this.paymentPurposeCode,
    required this.paymentPurpose,
    required this.paymentDeadline,
    required this.recipientIban,
    required this.recipientReference,
    required this.recipientName,
    required this.recipientAddress,
    required this.recipientCity,
  });

  @override
  String toString() => 'UpnData{'
      'payerIban: $payerIban, '
      'deposit: $deposit, '
      'withdrawal: $withdrawal, '
      'payerReference: $payerReference, '
      'payerName: $payerName, '
      'payerAddress: $payerAddress, '
      'payerCity: $payerCity, '
      'amount: $amount, '
      'paymentDate: $paymentDate, '
      'urgent: $urgent, '
      'paymentPurposeCode: $paymentPurposeCode, '
      'paymentPurpose: $paymentPurpose, '
      'paymentDeadline: $paymentDeadline, '
      'recipientIban: $recipientIban, '
      'recipientReference: $recipientReference, '
      'recipientName: $recipientName, '
      'recipientAddress: $recipientAddress, '
      'recipientCity: $recipientCity'
      '}';
}
