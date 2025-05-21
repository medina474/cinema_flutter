import 'package:test/test.dart';

void main() {
  group('Tests de Acteur', () {
    test('Addition', () {
      final a = 7;
      final b = 3;

      expect(a + b, equals(10));
    });

    test('Soustraction', () {
      final a = 7;
      final b = 3;

      expect(a - b, equals(4));
    });
  });
}
