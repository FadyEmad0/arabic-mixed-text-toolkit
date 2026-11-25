import 'dart:io';

import 'package:arabic_mixed_text_toolkit/arabic_mixed_text_toolkit.dart';

void main(List<String> args) {
  if (args.isEmpty || args.contains('--help') || args.contains('-h')) {
    _printUsage();
    return;
  }

  final command = args.first;
  final input = args.skip(1).join(' ');

  if (input.isEmpty) {
    stderr.writeln('Error: please provide text to process.');
    _printUsage();
    exitCode = 64;
    return;
  }

  switch (command) {
    case 'direction':
      final direction = detectTextDirection(input);
      stdout.writeln(switch (direction) {
        TextDirectionHint.rtl => 'RTL',
        TextDirectionHint.ltr => 'LTR',
        TextDirectionHint.neutral => 'NEUTRAL',
      });
      return;
    case 'normalize':
      stdout.writeln(normalizeArabic(input));
      return;
    default:
      stderr.writeln('Unknown command: $command');
      _printUsage();
      exitCode = 64;
  }
}

void _printUsage() {
  stdout.writeln('''
Arabic Mixed Text Toolkit

Usage:
  arabic-text-toolkit direction <text>
  arabic-text-toolkit normalize <text>
  arabic-text-toolkit --help

Commands:
  direction   Detect the first supported Arabic/Latin letter direction.
  normalize   Remove selected Arabic combining marks and tatweel.

Examples:
  arabic-text-toolkit direction "مرحبا Hello"
  arabic-text-toolkit normalize "مَرْحَبًا"

Note: Direction detection is a simplified hint, not full Unicode
Bidirectional Algorithm (UBA) layout or rendering.
''');
}
