import 'package:cinema/acteurs/acteur_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test('ActeurService', () async {
    final service = ActeurService();
    final acteurs = await service.fetch();
    expect(acteurs.length, equals(1103));
    expect(acteurs[0].nom, equals("Jean Reno"));
  });
}
