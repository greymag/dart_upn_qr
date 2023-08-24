import 'package:upn_qr/upn_qr.dart';

class UpnQRParser {
  // QR Character Set: ISO 8859-2. The use of Extended Channel Interpretation (ECI value 000004) is required.
  // At the end of each field, from sequence number 1 up to and including 20, add the punctuation LF (0x0A,
  // '\n'). If an individual field is blank, it contains only the punctuation mark.
  //
  // SN.  Field description         Max. length   QR content description
  // 1.   Leading style             5             Constant »UPNQR«.
  // 2.   Payer’s IBAN                            Rules for SI IBAN without spaces.
  // 3.   Deposit                   1             Uppercase "X" or blank.
  // 4.   Withdrawal                1             Uppercase "X" or blank
  // 5.   Payer’s reference         (4+22)        Model and reference together without spaces. 4 - SI or RF model rules.
  //                                              22 - Rules for SI or RF reference (without spaces
  // 6.   Payer’s name                            All characters of the ISO 8859-2 code
  //                                              table. No leading or following spaces
  // 7.   Payer’s street and No.                  All characters of the ISO 8859-2 code
  //                                              table. No leading or following spaces.
  // 8.   Payer’s city                            All characters of the ISO 8859-2 code
  //                                              table. No leading or following spaces.
  // 9.   Amount                                  Just numbers with leading zeros. Amount
  //                                              multiplied by 100 and without prefix or
  //                                              decimal places. The maximum amount
  //                                              that can be entered is
  //                                              999,999,999,999.99 (one billion - 1).
  //                                              If 0, the content is "00000000000"
  // 10.  Payment date                            Format 'DD.MM.YYYY'.
  // 11.  Urgent                    1             Uppercase "X" or blank. X X\n
  // 12.  Purpose code              4             Uppercase letters (A-Z). Purpose code rules.
  // 13.  Purpose of payment                      All characters of the ISO 8859-2 code table. No
  //                                              leading or following spaces.
  // 14.  Payment deadline                        Format 'DD.MM.YYYY'.
  // 15.  Recipient’s IBAN                        Rules for SEPA IBAN without spaces.
  // 16.  Recipient’s reference     (4+22)        Model and reference together without
  //                                              spaces. 4 - SI or RF model rules.
  //                                              22 - Rules for SI or RF reference (without spaces).
  // 17.  Recipient’s name                        All characters of the ISO 8859-2 code
  //                                              table. No leading or following spaces.
  // 18. Recipient’s street and No.               All characters of the ISO 8859-2 code
  //                                              table. No leading or following spaces.
  // 19.  Recipient’s city                        All characters of the ISO 8859-2 code
  //                                              table. No leading or following spaces.
  // 20.  Sum of the lengths of     3             Numbers with leading zeros.
  //      fields 1 to 19,                         Formula: Value = strlen(N1+'\n') + str-
  //      including punctuation                   len(N2+'\n') + ….. + strlen(N19+'\n').
  //      marks
  //      Reserve                                 Blank or spaces.
  //
  // (*) The reserve field may be blank or contain spaces and have no punctuation. The maximum length of the
  // reserve field is limited by the capacity of the QR record (V15, Binary, ECC_M, ECI ISO -8859-2), which is 411
  // characters. To complete the reserve field, the maximum length can be calculated using the following formula:
  // ReserveMaxLength = 411 - (strlen(N1+'\n') + strlen(N2+'\n') + ..... + strlen(N20+'\n')).
  //
  // The maximum length of the data, including punctuation without reserve, is 411 characters

  static const _maxLen = 411;

  /// Parse UPN QR code string data.
  static UpnData parseString(String value) {
    if (value.length > _maxLen) throw UnpQRParseError.tooLong();

    final lines = value.split('\n');
    if (lines.length > 21) throw UnpQRParseError.tooManyLines();
    if (lines.length < 20) throw UnpQRParseError.tooFewLines();

    var i = 0;
    if (lines[i++] != 'UPNQR') throw UnpQRParseError.invalidFormat();

    final payerIban = _parseStr(lines[i++]);
    final deposit = _parseBool(lines[i++]);
    final withdrawal = _parseBool(lines[i++]);
    final payerReference = _parseStr(lines[i++]);
    final payerName = _parseStr(lines[i++]);
    final payerAddress = _parseStr(lines[i++]);
    final payerCity = _parseStr(lines[i++]);
    final amount = _requireStr(lines[i++], UnpQRParseErrorType.missedAmount);
    final paymentDate = _parseStr(lines[i++]);
    final urgent = _parseBool(lines[i++]);
    final paymentPurposeCode = _parseStr(lines[i++]);
    final paymentPurpose = _parseStr(lines[i++]);
    final paymentDeadline = _parseStr(lines[i++]);
    final recipientIban = _parseStr(lines[i++]);
    final recipientReference = _parseStr(lines[i++]);
    final recipientName = _parseStr(lines[i++]);
    final recipientAddress = _parseStr(lines[i++]);
    final recipientCity = _parseStr(lines[i++]);

    final checkSum = int.tryParse(
        _requireStr(lines[i++], UnpQRParseErrorType.missedChecksum));
    if (checkSum == null) throw UnpQRParseError.invalidChecksumFormat();

    final calculatedChecksum =
        lines.take(19).fold(0, (v, l) => v + l.length + 1);

    if (calculatedChecksum != checkSum) {
      throw UnpQRParseError.checksumNotMatched();
    }

    return UpnData(
      payerIban: payerIban,
      deposit: deposit,
      withdrawal: withdrawal,
      payerReference: payerReference,
      payerName: payerName,
      payerAddress: payerAddress,
      payerCity: payerCity,
      amount: amount,
      paymentDate: paymentDate,
      urgent: urgent,
      paymentPurposeCode: paymentPurposeCode,
      paymentPurpose: paymentPurpose,
      paymentDeadline: paymentDeadline,
      recipientIban: recipientIban,
      recipientReference: recipientReference,
      recipientName: recipientName,
      recipientAddress: recipientAddress,
      recipientCity: recipientCity,
    );
  }

  static String? _parseStr(String value) => value.isEmpty ? null : value;

  static String _requireStr(String value, UnpQRParseErrorType errorType) =>
      value.isEmpty ? throw UnpQRParseError(errorType) : value;

  static bool _parseBool(String value) => value.toLowerCase() == 'x';

  UpnQRParser._();
}
