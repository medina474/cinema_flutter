import 'package:cinema/api/acteur_service.dart';
import 'package:cinema/models/acteur.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([ActeurSchema], directory: dir.path);

  final service = ActeurService(isar);
  final acteurs = await service.fetch();
  expect(acteurs.length, equals(1103));
  expect(acteurs[0].nom, equals("Jean Reno"));
}
