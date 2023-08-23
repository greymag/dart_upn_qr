# upn_qr

Library for parse UPN QR code content.

UNP (Univerzalni plačilni nalog) - Universal Payment Order for Slovenia.

See https://www.zbs-giz.si/placilni-promet/

## Usage

Use methods from `UpnQRParser`.

```dart
const data = UpnQRParser.parseString(qrCodeString);
print('Recipient IBAN: ${data.recipientIban}, amount: ${data.amount}')
```