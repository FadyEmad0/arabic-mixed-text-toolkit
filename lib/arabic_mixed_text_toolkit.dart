
/// Utilities for working with Arabic and English mixed text.
///
/// This library provides basic text direction detection and Arabic text
/// normalization helpers.
library arabic_mixed_text_toolkit;

/// Represents the writing direction of a text.
enum TextDirectionHint {
  rtl,
  ltr,
  neutral,
}

/// Detects the direction of the first strong character in [text].
///
/// Arabic characters are considered RTL.
/// Latin letters are considered LTR.
/// If no strong character is found, [TextDirectionHint.neutral] is returned.
TextDirectionHint detectTextDirection(String text) {
  for (final rune in text.runes) {
    if (_isArabic(rune)) {
      return TextDirectionHint.rtl;
    }

    if (_isLatin(rune)) {
      return TextDirectionHint.ltr;
    }
  }

  return TextDirectionHint.neutral;
}

/// Removes Arabic diacritical marks and tatweel from [text].
///
/// This is useful for basic Arabic text normalization and comparison.
String normalizeArabic(String text) {
  return text
      .replaceAll(RegExp(r'[\u064B-\u065F\u0670\u06D6-\u06ED]'), '')
      .replaceAll('\u0640', '');
}

bool _isArabic(int rune) {
  return (rune >= 0x0600 && rune <= 0x06FF) ||
      (rune >= 0x0750 && rune <= 0x077F) ||
      (rune >= 0x08A0 && rune <= 0x08FF) ||
      (rune >= 0xFB50 && rune <= 0xFDFF) ||
      (rune >= 0xFE70 && rune <= 0xFEFF);
}

bool _isLatin(int rune) {
  return (rune >= 0x0041 && rune <= 0x005A) ||
      (rune >= 0x0061 && rune <= 0x007A);
}
