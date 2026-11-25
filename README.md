# Arabic Mixed Text Toolkit

A small Dart package containing focused utilities for simple Arabic and English mixed-text workflows.

## Current status

Version 1.0.0 is available as a GitHub release. The package is not currently published on pub.dev. It is an early-stage project, and its API and supported Unicode coverage may evolve.

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

## Windows installation

A standalone Windows x64 executable and a Windows setup installer are built by GitHub Actions on feature-branch pushes.

- `arabic-text-toolkit-windows-x64`: portable command-line executable.
- `arabic-text-toolkit-windows-installer`: `ArabicTextToolkit-Setup.exe`, a Windows installer that installs the CLI executable, adds a Start Menu shortcut, optionally adds a desktop shortcut, and registers an uninstaller in Windows.

The installer does **not** add a graphical user interface. Its shortcuts open a terminal showing the command help. To use commands directly, open PowerShell in the installation folder and run:

```powershell
.\arabic-text-toolkit.exe direction "مرحبا Hello"
.\arabic-text-toolkit.exe normalize "مَرْحَبًا"
```

Workflow artifacts are temporary and currently retained for 14 days. This project is still at an early adoption stage; no verified usage or download figures are currently published.
