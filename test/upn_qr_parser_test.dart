import 'package:test/test.dart';
import 'package:upn_qr/upn_qr.dart';

part 'upn_qr_parser_test.data.dart';
part 'upn_qr_parser_test.expect.dart';

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

        expectSample(res);
      });

      test(
          'should parse string example A: '
          'Order for the payment of obligations (cash)', () {
        final res = UpnQRParser.parseString(upnQR_ExampleA);
        expectExampleA(res);
      });

      test(
          'should parse string example B: '
          'Order for the payment of obligations (non-cash)', () {
        final res = UpnQRParser.parseString(upnQR_ExampleB);
        expectExampleB(res);
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
