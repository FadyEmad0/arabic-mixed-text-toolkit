# Arabic Mixed Text Toolkit

A lightweight Dart package with small utilities for mixed Arabic and English text.

## Current features

- Detects the direction of the first supported Arabic or Latin character.
- Removes common Arabic diacritic marks and tatweel.
- Returns a neutral direction when no supported Arabic or Latin character is found.

## Installation

This package is currently under development and is not yet published on pub.dev.

For local development, add it to your `pubspec.yaml` using a path dependency:

```yaml
dependencies:
  arabic_mixed_text_toolkit:
    path: ../arabic-mixed-text-toolkit
```

## Usage

```dart
import 'package:arabic_mixed_text_toolkit/arabic_mixed_text_toolkit.dart';

void main() {
  final direction = detectTextDirection('مرحبا Hello');
  final normalized = normalizeArabic('مَرْحَبًا');

  print(direction); // TextDirectionHint.rtl
  print(normalized); // مرحبا
}
```

## Run tests

Install the Dart SDK, then run:

```bash
dart pub get
dart test
```

## Limitations

This is an initial utility package, not a complete Unicode Bidirectional Algorithm implementation. Direction detection currently recognizes the Arabic Unicode blocks and basic Latin letters supported by the implementation. It does not determine full paragraph layout or visual ordering.

Arabic normalization removes selected diacritic code points and tatweel; it does not perform full linguistic normalization, stemming, or spelling correction.

## Project status

Early development. APIs and behavior may change before the first stable release.

## Contributing

Bug reports, focused improvements, and additional tests are welcome. Please include reproducible examples for text-direction or normalization issues.
