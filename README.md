# Arabic Mixed Text Toolkit

A small Dart package containing focused utilities for simple Arabic and English mixed-text workflows.

## Current status

Early development (pre-1.0). The API may change. This package is not yet published on pub.dev.

## Features

- Detects the first supported strong Arabic or basic Latin letter in a string.
- Ignores digits, punctuation, combining marks, and whitespace when detecting direction.
- Removes selected Arabic combining marks and tatweel.
- Includes unit tests and a GitHub Actions workflow for static analysis and tests.

## Important scope and limitations

This package does **not** implement the Unicode Bidirectional Algorithm (UBA). Its direction result is a lightweight hint only; it does not calculate visual ordering, paragraph embedding levels, or correct rendering of arbitrary mixed-direction text. Use the text-layout engine provided by the target platform for actual bidirectional rendering.

Arabic letter recognition currently covers selected Arabic script ranges, while Latin recognition is limited to basic A-Z and a-z. Additional scripts and Unicode edge cases need explicit tests before being claimed as supported.

Arabic normalization removes selected combining-mark code points and tatweel. It does not perform full Unicode normalization, spelling correction, stemming, or linguistic normalization. Do not use it as a substitute for language-aware search or identity/security comparisons without reviewing the consequences.

## Development

Requires the Dart SDK.

```bash
dart pub get
dart analyze
dart test
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

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request. Include focused tests and reproducible examples for behavior changes.

## License

No license has been selected yet. Until a license is added by the repository owner, the repository should be treated as having no grant of permission for reuse beyond the rights provided by applicable law.


## Install and run locally on Windows

This package includes a small command-line demo. It requires the Dart SDK.

1. Download the repository ZIP from GitHub (Code → Download ZIP) and extract it.
2. Open Command Prompt or PowerShell in the extracted project folder (the folder containing `pubspec.yaml`).
3. Run:

```powershell
dart pub get
dart pub global activate --source path .
```

4. Try the commands:

```powershell
arabic-text-toolkit direction "مرحبا Hello"
arabic-text-toolkit normalize "مَرْحَبًا"
```

If Windows says the command is not recognized, add Dart's Pub cache bin directory to your PATH. The default location is `%LOCALAPPDATA%\Pub\Cache\bin`. Then open a new terminal window.

To uninstall:

```powershell
dart pub global deactivate arabic_mixed_text_toolkit
```

This is a command-line test utility, not a graphical Windows application or an installer (.msi/.exe). The package remains in early development.
