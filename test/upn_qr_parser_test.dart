import 'package:test/test.dart';
import 'package:upn_qr/upn_qr.dart';

part 'upn_qr_parser_test.data.dart';

void main() {
  group('UpnQRParser', () {
    group('parseString()', () {
      test('should parse string content', () {
        final res = UpnQRParser.parseString(upnQR_1);
        expectBasicData(res);
      });
      test('should parse string content with space at end of address', () {
        final res = UpnQRParser.parseString(upnQR_WithSpaceAtEndOfAddress);
        expectBasicData(res, payerAddress: 'BARJANSKA CESTA 70 ');
      });
      test('should parse string content sample', () {
        final res = UpnQRParser.parseString(upnQR_Sample);

        expectData(
          res,
          payerIban: 'SI56020170014356205',
          payerReference: 'SI00225268-32526-222',
          payerName: "Any company Ltd.",
          payerAddress: "Lepa cesta 10",
          payerCity: "2000 Maribor",
          amount: "00000126874",
          paymentDate: '11.07.2016',
          urgent: true,
          paymentPurposeCode: 'CPYR',
          paymentPurpose: 'Invoice payment 18/2016.',
          recipientIban: 'SI56020360253863406',
          recipientReference: 'SI081236-17-345679',
          recipientName: 'Bank Association of Slovenia - GIZ',
          recipientAddress: 'Šubičeva 2',
          recipientCity: '1000 Ljubljana',
        );
      });

      test(
          'should parse string example A: '
          'Order for the payment of obligations (cash)', () {
        final res = UpnQRParser.parseString(upnQR_ExampleA);
        expectData(
          res,
          payerName: "Janez Novak",
          payerAddress: "Dunajska 1",
          payerCity: "1000 Ljubljana",
          amount: "00000008105",
          paymentPurposeCode: 'COST',
          paymentPurpose: 'Plačilo obveznosti 10/2016',
          recipientIban: 'SI56051008010486080',
          recipientReference: 'SI0598765432100',
          recipientName: 'Novo podjetje d.o.o.',
          recipientAddress: 'Lepa cesta 15',
          recipientCity: '3698 Loški Potok',
        );
      });

      test(
          'should parse string example B: '
          'Order for the payment of obligations (non-cash)', () {
        final res = UpnQRParser.parseString(upnQR_ExampleB);
        expectData(
          res,
          payerIban: 'SI56020170014356205',
          payerReference: 'SI003528-990',
          payerName: "Združenje bank Slovenije",
          payerAddress: "Šubičeva 2",
          payerCity: "1000 Ljubljana",
          amount: "00000128067",
          paymentPurposeCode: 'ADVA',
          paymentPurpose: 'Plačilo avansa-ponudba 2016/12',
          recipientIban: 'SI56051008010486080',
          recipientReference: 'SI00123456-67890-12345',
          recipientName: 'Novo podjetje d.o.o.',
          recipientAddress: 'Lepa cesta 15',
          recipientCity: '3698 Loški Potok',
        );
      });

      test('should parse zero amount', () {
        final res = UpnQRParser.parseString(upnQR_ZeroAmount);
        expectBasicData(res, amount: '00000000000');
      });

      test('should parse content with reserve string', () {
        final res = UpnQRParser.parseString(upnQR_21_lines);
        expectBasicData(res);
      });

      test('should throw invalidFormat error if no leading', () {
        expect(
          () => UpnQRParser.parseString(upnQR_NoLeading),
          _throwsA(UnpQRParseErrorType.invalidFormat),
        );
      });

      test('should throw tooLong error if length in more that 411', () {
        expect(
          () => UpnQRParser.parseString(upnQR_412_chars),
          _throwsA(UnpQRParseErrorType.tooLong),
        );
      });

      test(
          'should throw tooFewLines error if '
          'content has more than 19 lines', () {
        expect(
          () => UpnQRParser.parseString(upnQR_19_lines),
          _throwsA(UnpQRParseErrorType.tooFewLines),
        );
      });

      test(
          'should throw tooManyLines error if '
          'content has more than 21 lines', () {
        expect(
          () => UpnQRParser.parseString(upnQR_22_lines),
          _throwsA(UnpQRParseErrorType.tooManyLines),
        );
      });

      test(
          'should throw invalidChecksumFormat error if check sum is not a number',
          () {
        expect(
          () => UpnQRParser.parseString(upnQR_InvalidChecksumFormat),
          _throwsA(UnpQRParseErrorType.invalidChecksumFormat),
        );
      });

      test(
          'should throw checksumNotMatched error if '
          'check sum is not matched content', () {
        expect(
          () => UpnQRParser.parseString(upnQR_InvalidChecksumValue),
          _throwsA(UnpQRParseErrorType.checksumNotMatched),
        );
      });

      test('should throw missedAmount error if no amount', () {
        expect(
          () => UpnQRParser.parseString(upnQR_NoAmount),
          _throwsA(UnpQRParseErrorType.missedAmount),
        );
      });

      test('should throw missedAmount error if no checksum', () {
        expect(
          () => UpnQRParser.parseString(upnQR_InvalidChecksumEmpty),
          _throwsA(UnpQRParseErrorType.missedChecksum),
        );
      });
    });
  });
}

Matcher _throwsA(UnpQRParseErrorType type) =>
    throwsA(isA<UnpQRParseError>().having((e) => e.type, 'type', type));

void expectData(
  UpnData data, {
  String? payerIban,
  bool deposit = false,
  bool withdrawal = false,
  String? payerReference,
  String? payerName,
  String? payerAddress,
  String? payerCity,
  required String amount,
  String? paymentDate,
  bool urgent = false,
  String? paymentPurposeCode,
  String? paymentPurpose,
  String? paymentDeadline,
  String? recipientIban,
  String? recipientReference,
  String? recipientName,
  String? recipientAddress,
  String? recipientCity,
}) {
  expect(data.payerIban, payerIban);
  expect(data.deposit, deposit);
  expect(data.withdrawal, withdrawal);
  expect(data.payerReference, payerReference);
  expect(data.payerName, payerName);
  expect(data.payerAddress, payerAddress);
  expect(data.payerCity, payerCity);
  expect(data.amount, amount);
  expect(data.paymentDate, paymentDate);
  expect(data.urgent, urgent);
  expect(data.paymentPurposeCode, paymentPurposeCode);
  expect(data.paymentPurpose, paymentPurpose);
  expect(data.paymentDeadline, paymentDeadline);
  expect(data.recipientIban, recipientIban);
  expect(data.recipientReference, recipientReference);
  expect(data.recipientName, recipientName);
  expect(data.recipientAddress, recipientAddress);
  expect(data.recipientCity, recipientCity);
}

void expectBasicData(
  UpnData data, {
  String? payerIban = 'SI56011008881234567',
  bool deposit = false,
  bool withdrawal = false,
  String? payerReference = 'RF035126080',
  String? payerName = 'ORANGE DOG, RAČUNALNIŠKO PROGRAMI',
  String? payerAddress = 'BARJANSKA CESTA 70',
  String? payerCity = '1000 Ljubljana',
  String amount = '00000003400',
  String? paymentDate,
  bool urgent = false,
  String? paymentPurposeCode = 'VATX',
  String? paymentPurpose = 'Plačilo DDV za: 7-7.2023',
  String? paymentDeadline = '31.08.2023',
  String? recipientIban = 'SI56011008881000030',
  String? recipientReference = 'SI1935980621-62006',
  String? recipientName = 'RS PREHODNI DAVČNI PODRAČUN',
  String? recipientAddress = 'Gregorčičeva ulica 20',
  String? recipientCity = 'Ljubljana',
}) =>
    expectData(
      data,
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
