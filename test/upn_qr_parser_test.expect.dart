part of 'upn_qr_parser_test.dart';

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

void expectSample(UpnData data) => expectData(
      data,
      payerIban: 'SI56020170014356205',
      payerReference: 'SI00225268-32526-222',
      payerName: 'Any company Ltd.',
      payerAddress: 'Lepa cesta 10',
      payerCity: '2000 Maribor',
      amount: '00000126874',
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

void expectExampleA(UpnData data) => expectData(
      data,
      payerName: 'Janez Novak',
      payerAddress: 'Dunajska 1',
      payerCity: '1000 Ljubljana',
      amount: '00000008105',
      paymentPurposeCode: 'COST',
      paymentPurpose: 'Plačilo obveznosti 10/2016',
      recipientIban: 'SI56051008010486080',
      recipientReference: 'SI0598765432100',
      recipientName: 'Novo podjetje d.o.o.',
      recipientAddress: 'Lepa cesta 15',
      recipientCity: '3698 Loški Potok',
    );

void expectExampleB(UpnData data) => expectData(
      data,
      payerIban: 'SI56020170014356205',
      payerReference: 'SI003528-990',
      payerName: 'Združenje bank Slovenije',
      payerAddress: 'Šubičeva 2',
      payerCity: '1000 Ljubljana',
      amount: '00000128067',
      paymentPurposeCode: 'ADVA',
      paymentPurpose: 'Plačilo avansa-ponudba 2016/12',
      recipientIban: 'SI56051008010486080',
      recipientReference: 'SI00123456-67890-12345',
      recipientName: 'Novo podjetje d.o.o.',
      recipientAddress: 'Lepa cesta 15',
      recipientCity: '3698 Loški Potok',
    );

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
