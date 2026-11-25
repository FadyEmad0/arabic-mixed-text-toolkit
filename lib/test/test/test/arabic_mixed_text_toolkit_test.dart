
import 'package:test/test.dart';
import '../lib/arabic_mixed_text_toolkit.dart';

void main() {
  group('detectTextDirection', () {
    test('detects Arabic as RTL', () {
      expect(detectTextDirection('مرحبا'), TextDirectionHint.rtl);
    });

    test('detects English as LTR', () {
      expect(detectTextDirection('Hello'), TextDirectionHint.ltr);
    });

    test('detects the first strong character', () {
      expect(
        detectTextDirection('123 مرحبا Hello'),
        TextDirectionHint.rtl,
      );
    });

    test('returns neutral for numbers only', () {
      expect(detectTextDirection('12345'), TextDirectionHint.neutral);
    });
  });

  group('normalizeArabic', () {
    test('removes Arabic diacritics', () {
      expect(normalizeArabic('مَرْحَبًا'), 'مرحبا');
    });

    test('removes tatweel', () {
      expect(normalizeArabic('الســلام'), 'السلام');
    });

    test('preserves English text', () {
      expect(normalizeArabic('Hello 123'), 'Hello 123');
    });
  });
}
