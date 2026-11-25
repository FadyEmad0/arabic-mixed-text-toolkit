import 'package:arabic_mixed_text_toolkit/arabic_mixed_text_toolkit.dart';
import 'package:test/test.dart';

void main() {
  group('detectTextDirection', () {
    test('detects Arabic letters as RTL', () {
      expect(detectTextDirection('مرحبا'), TextDirectionHint.rtl);
    });

    test('detects basic Latin letters as LTR', () {
      expect(detectTextDirection('Hello'), TextDirectionHint.ltr);
    });

    test('uses the first supported strong letter', () {
      expect(
        detectTextDirection('123 مرحبا Hello'),
        TextDirectionHint.rtl,
      );
      expect(
        detectTextDirection('123 Hello مرحبا'),
        TextDirectionHint.ltr,
      );
    });

    test('returns neutral for empty text, digits, and punctuation', () {
      expect(detectTextDirection(''), TextDirectionHint.neutral);
      expect(detectTextDirection('12345'), TextDirectionHint.neutral);
      expect(detectTextDirection('!?.,'), TextDirectionHint.neutral);
    });

    test('Arabic-Indic digits do not determine direction', () {
      expect(detectTextDirection('١٢٣٤٥'), TextDirectionHint.neutral);
    });

    test('Arabic punctuation does not determine direction', () {
      expect(detectTextDirection('، ؛ ؟'), TextDirectionHint.neutral);
    });

    test('ignores combining marks before the first letter', () {
      expect(detectTextDirection('\u064Eمرحبا'), TextDirectionHint.rtl);
    });
  });

  group('normalizeArabic', () {
    test('removes common Arabic diacritics', () {
      expect(normalizeArabic('مَرْحَبًا'), 'مرحبا');
    });

    test('removes additional Arabic combining marks', () {
      expect(normalizeArabic('ا\u0610لسلام'), 'السلام');
    });

    test('removes tatweel', () {
      expect(normalizeArabic('الســلام'), 'السلام');
    });

    test('preserves English text and numbers', () {
      expect(normalizeArabic('Hello 123'), 'Hello 123');
    });

    test('preserves ordinary Arabic letters, spaces, and punctuation', () {
      expect(normalizeArabic('السلام عليكم، أهلاً!'), 'السلام عليكم، أهلاً!');
    });

    test('handles empty text', () {
      expect(normalizeArabic(''), '');
    });
  });
}
