# upn_qr

[![pub package](https://img.shields.io/pub/v/upn_qr)](https://pub.dev/packages/upn_qr)
![Analyze & Test](https://github.com/greymag/dart_upn_qr/actions/workflows/dart.yml/badge.svg?branch=main)
[![innim lint](https://img.shields.io/badge/style-innim_lint-40c4ff.svg)](https://pub.dev/packages/innim_lint)

Library for parse UPN QR code content.

UNP (Univerzalni plačilni nalog) - Universal Payment Order for Slovenia.

See https://www.zbs-giz.si/placilni-promet/

## Usage

Use methods from `UpnQRParser`.

```dart
const data = UpnQRParser.parseString(qrCodeString);
print('Recipient IBAN: ${data.recipientIban}, amount: ${data.amount}')
```