import 'package:test/test.dart';
import 'package:upn_qr/upn_qr.dart';

part 'upn_qr_parser_test.data.dart';

void main() {
  group('UpnQRParser', () {
    group('parseString()', () {
      test('should parse string content', () {
        final res = UpnQRParser.parseString(upnQR_1);

        expect(res.payerIban, 'SI56011008881234567');
        expect(res.deposit, false);
        expect(res.withdrawal, false);
        expect(res.payerReference, 'RF035126080');
        expect(res.payerName, 'ORANGE DOG, RAČUNALNIŠKO PROGRAMI');
        expect(res.payerAddress, 'BARJANSKA CESTA 70');
        expect(res.payerCity, '1000 Ljubljana');
        expect(res.amount, '00000003400');
        expect(res.paymentDate, null);
        expect(res.urgent, false);
        expect(res.paymentPurposeCode, 'VATX');
        expect(res.paymentPurpose, 'Plačilo DDV za: 7-7.2023');
        expect(res.paymentDeadline, '31.08.2023');
        expect(res.recipientIban, 'SI56011008881000030');
        expect(res.recipientReference, 'SI1935980621-62006');
        expect(res.recipientName, 'RS PREHODNI DAVČNI PODRAČUN');
        expect(res.recipientAddress, 'Gregorčičeva ulica 20');
        expect(res.recipientCity, 'Ljubljana');
      });

      test('should throw invalidFormat error if no leading', () {
        expect(
          () => UpnQRParser.parseString(upnQR_2),
          _throwsA(UnpQRParseErrorType.invalidFormat),
        );
      });
    });
  });
}

Matcher _throwsA(UnpQRParseErrorType type) =>
    throwsA(isA<UnpQRParseError>().having((e) => e.type, 'type', type));
