/// Utilities for working with Arabic and English mixed text.
///
/// This library provides lightweight helpers for identifying the first
/// supported strong text direction and removing selected Arabic combining
/// marks. It is not a full implementation of the Unicode Bidirectional
/// Algorithm.
library arabic_mixed_text_toolkit;

/// A simplified text-direction hint.
///
/// [rtl] is returned for supported Arabic letters, [ltr] for supported
/// Latin letters, and [neutral] when no supported strong letter is found.
enum TextDirectionHint {
  /// Right-to-left text.
  rtl,

  /// Left-to-right text.
  ltr,

  /// No supported strong directional letter was found.
  neutral,
}

/// Detects the direction of the first supported strong letter in [text].
///
/// The function scans Unicode code points from left to right. It recognizes
/// Arabic letters in selected Arabic script ranges and basic Latin letters.
/// Digits, punctuation, combining marks, and whitespace do not determine the
/// result.
///
/// This is a practical hint for simple interfaces, not full bidirectional
/// layout. Use a platform text engine that implements the Unicode
/// Bidirectional Algorithm when rendering mixed-direction paragraphs.
///
/// Examples:
/// ```dart
/// detectTextDirection('مرحبا Hello'); // TextDirectionHint.rtl
/// detectTextDirection('Hello مرحبا'); // TextDirectionHint.ltr
/// detectTextDirection('١٢٣'); // TextDirectionHint.neutral
/// ```
TextDirectionHint detectTextDirection(String text) {
  for (final rune in text.runes) {
    if (_isArabicLetter(rune)) {
      return TextDirectionHint.rtl;
    }

    if (_isBasicLatinLetter(rune)) {
      return TextDirectionHint.ltr;
    }
  }

  return TextDirectionHint.neutral;
}

/// Removes selected Arabic combining marks and tatweel from [text].
///
/// This helper preserves ordinary Arabic letters, Latin text, digits, spaces,
/// and punctuation. It does not perform spelling correction, stemming,
/// canonical Unicode normalization, or full linguistic normalization.
///
/// Examples:
/// ```dart
/// normalizeArabic('مَرْحَبًا'); // 'مرحبا'
/// normalizeArabic('الســلام'); // 'السلام'
/// ```
String normalizeArabic(String text) {
  return text
      .replaceAll(
        RegExp(r'[\u0610-\u061A\u064B-\u065F\u0670\u06D6-\u06DC\u06DF-\u06E4\u06E7-\u06E8\u06EA-\u06ED\u08CA-\u08E1\u08E3-\u08FF]'),
        '',
      )
      .replaceAll('\u0640', '');
}

bool _isArabicLetter(int rune) {
  // Arabic, Arabic Supplement, and selected Arabic Extended-A letters.
  // Exclude punctuation, digits, and combining marks by using letter ranges.
  return (rune >= 0x0620 && rune <= 0x063F) ||
      (rune >= 0x0641 && rune <= 0x064A) ||
      (rune >= 0x066E && rune <= 0x066F) ||
      (rune >= 0x0671 && rune <= 0x06D3 && rune != 0x0670) ||
      rune == 0x06D5 ||
      (rune >= 0x06EE && rune <= 0x06EF) ||
      (rune >= 0x06FA && rune <= 0x06FC) ||
      rune == 0x06FF ||
      (rune >= 0x0750 && rune <= 0x077F) ||
      (rune >= 0x08A0 && rune <= 0x08C9);
}

bool _isBasicLatinLetter(int rune) {
  return (rune >= 0x0041 && rune <= 0x005A) ||
      (rune >= 0x0061 && rune <= 0x007A);
}
