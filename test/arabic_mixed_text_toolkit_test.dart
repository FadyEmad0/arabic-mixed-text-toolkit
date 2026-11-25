import 'package:arabic_mixed_text_toolkit/arabic_mixed_text_toolkit.dart';
import 'package:test/test.dart';

void main() {
  group('detectTextDirection', () {
    test('detects Arabic as RTL', () {
      expect(detectTextDirection('مرحبا'), TextDirectionHint.rtl);
    });

    test('detects English as LTR', () {
      expect(detectTextDirection('Hello'), TextDirectionHint.ltr);
    });

    test('uses the first supported character after digits and spaces', () {
      expect(
        detectTextDirection('123 مرحبا Hello'),
        TextDirectionHint.rtl,
      );
    });

    test('returns neutral for numbers only', () {
      expect(detectTextDirection('12345'), TextDirectionHint.neutral);
    });

    test('returns neutral for empty text', () {
      expect(detectTextDirection(''), TextDirectionHint.neutral);
    });

    test('returns neutral for punctuation only', () {
      expect(detectTextDirection('!?.,'), TextDirectionHint.neutral);
    });

    test('detects Latin when it appears before Arabic', () {
      expect(
        detectTextDirection('Hello مرحبا'),
        TextDirectionHint.ltr,
      );
    });
  });

  group('normalizeArabic', () {
    test('removes Arabic diacritics', () {
      expect(normalizeArabic('مَرْحَبًا'), 'مرحبا');
    });

    test('removes tatweel', () {
      expect(normalizeArabic('الســلام'), 'السلام');
    });

    test('preserves English text and numbers', () {
      expect(normalizeArabic('Hello 123'), 'Hello 123');
    });

    test('preserves ordinary Arabic letters', () {
      expect(normalizeArabic('السلام عليكم'), 'السلام عليكم');
    });

    test('handles empty text', () {
      expect(normalizeArabic(''), '');
    });
  });
}
