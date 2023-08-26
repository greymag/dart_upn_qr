import 'package:upn_qr/upn_qr.dart';

void main() {
  const qrCodeString = '''
UPNQR




Janez Novak
Dunajska 1
1000 Ljubljana
00000008105


COST
Plačilo obveznosti 10/2016

SI56051008010486080
SI0598765432100
Novo podjetje d.o.o.
Lepa cesta 15
3698 Loški Potok
183
''';

  final data = UpnQRParser.parseString(qrCodeString);
  final amount = int.parse(data.amount) / 100;

  print('Payment to:\n'
      '${data.recipientName}\n'
      'IBAN: ${data.recipientIban}\n'
      'Amount: $amount EUR');

  // Payment to:
  // Novo podjetje d.o.o.
  // IBAN: SI56051008010486080
  // Amount: 81.05 EUR
}
