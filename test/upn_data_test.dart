import 'package:test/test.dart';
import 'package:upn_qr/upn_qr.dart';

void main() {
  group('UpnData', () {
    group('equality:', () {
      test('should be equal to itself', () {
        final data = createData();

        expect(data == data, true);
      });

      test('should be equal to another object with same field values', () {
        final a = createData();
        final b = createData();

        expect(a == b, true);
      });

      test('should be not equal to another object with different payerIban',
          () {
        final a = createData(payerIban: 'SI56011008881234567');
        final b = createData(payerIban: 'BE56011008881234567');

        expect(a == b, false);
      });

      test('should be not equal to another object with different deposit', () {
        final a = createData(deposit: true);
        final b = createData(deposit: false);

        expect(a == b, false);
      });

      test('should be not equal to another object with different withdrawal',
          () {
        final a = createData(withdrawal: true);
        final b = createData(withdrawal: false);

        expect(a == b, false);
      });

      test(
          'should be not equal to another object with different payerReference',
          () {
        final a = createData(payerReference: 'RF035126080');
        final b = createData(payerReference: 'RF123456789');

        expect(a == b, false);
      });

      test('should be not equal to another object with different payerName',
          () {
        final a = createData(payerName: '1');
        final b = createData(payerName: '2');

        expect(a == b, false);
      });

      test('should be not equal to another object with different payerAddress',
          () {
        final a = createData(payerAddress: '1');
        final b = createData(payerAddress: '2');

        expect(a == b, false);
      });

      test('should be not equal to another object with different payerCity',
          () {
        final a = createData(payerCity: '1');
        final b = createData(payerCity: '2');

        expect(a == b, false);
      });

      test('should be not equal to another object with different amount', () {
        final a = createData(amount: '00000003400');
        final b = createData(amount: '00000001200');

        expect(a == b, false);
      });

      test('should be not equal to another object with different paymentDate',
          () {
        final a = createData(paymentDate: null);
        final b = createData(paymentDate: '2');

        expect(a == b, false);
      });

      test('should be not equal to another object with different urgent', () {
        final a = createData(urgent: true);
        final b = createData(urgent: false);

        expect(a == b, false);
      });

      test(
          'should be not equal to another object with different paymentPurposeCode',
          () {
        final a = createData(paymentPurposeCode: 'VAT');
        final b = createData(paymentPurposeCode: 'SAL');

        expect(a == b, false);
      });

      test(
          'should be not equal to another object with different paymentPurpose',
          () {
        final a = createData(paymentPurpose: '1');
        final b = createData(paymentPurpose: '2');

        expect(a == b, false);
      });

      test(
          'should be not equal to another object with different paymentDeadline',
          () {
        final a = createData(paymentDeadline: '31.08.2023');
        final b = createData(paymentDeadline: '30.08.2023');

        expect(a == b, false);
      });

      test('should be not equal to another object with different recipientIban',
          () {
        final a = createData(recipientIban: 'SI56011008881000030');
        final b = createData(recipientIban: 'SI12345008881000030');

        expect(a == b, false);
      });

      test(
          'should be not equal to another object with different recipientReference',
          () {
        final a = createData(recipientReference: '1');
        final b = createData(recipientReference: '2');

        expect(a == b, false);
      });

      test('should be not equal to another object with different recipientName',
          () {
        final a = createData(recipientName: '1');
        final b = createData(recipientName: '2');

        expect(a == b, false);
      });

      test(
          'should be not equal to another object with different recipientAddress',
          () {
        final a = createData(recipientAddress: '1');
        final b = createData(recipientAddress: '2');

        expect(a == b, false);
      });

      test('should be not equal to another object with different recipientCity',
          () {
        final a = createData(recipientCity: '1');
        final b = createData(recipientCity: '2');

        expect(a == b, false);
      });
    });

    group('getPaymentDate()', () {
      test('should return correct DateTime if presented', () {
        final data = createData(paymentDate: '11.07.2016');

        final res = data.getPaymentDate();

        expect(res, DateTime(2016, 7, 11));
      });

      test('should return correct null if not presented', () {
        final data = createData(paymentDate: null);

        final res = data.getPaymentDate();

        expect(res, null);
      });
    });

    group('getPaymentDeadline()', () {
      test('should return correct DateTime if presented', () {
        final data = createData(paymentDeadline: '06.11.2023');

        final res = data.getPaymentDeadline();

        expect(res, DateTime(2023, 11, 6));
      });

      test('should return correct null if not presented', () {
        final data = createData(paymentDeadline: null);

        final res = data.getPaymentDeadline();

        expect(res, null);
      });
    });
  });
}

UpnData createData({
  String? payerIban = 'SI56011008881234567',
  bool deposit = false,
  bool withdrawal = false,
  String? payerReference = 'RF035126080',
  String? payerName = 'ORANGE DOG',
  String? payerAddress = 'BARJANSKA CESTA 70',
  String? payerCity = '1000 Ljubljana',
  String amount = '00000003400',
  String? paymentDate,
  bool urgent = false,
  String? paymentPurposeCode = 'VAT',
  String? paymentPurpose = 'Payment by invoice',
  String? paymentDeadline = '31.08.2023',
  String? recipientIban = 'SI56011008881000030',
  String? recipientReference = 'SI1935980621-62006',
  String? recipientName = 'Receiver',
  String? recipientAddress = 'Main street 20',
  String? recipientCity = 'Ljubljana',
}) =>
    UpnData(
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
