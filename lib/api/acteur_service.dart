import 'dart:convert';

import 'package:isar/isar.dart';

import 'api_client.dart';
import '../models/acteur.dart';

class ActeurService {
  final Isar isar;

  ActeurService(this.isar);

  final _client = ApiClient();

  Future<List<Acteur>> fetch() async {
    try {
      final response = await _client.get('/acteurs');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        final acteurs =
            data.map<Acteur>((json) => Acteur.fromJson(json)).toList();

        // Remplacer le cache
        await isar.writeTxn(() async {
          await isar.acteurs.clear();
          await isar.acteurs.putAll(acteurs);
        });
        return acteurs;
      } else {
        throw Exception('Échec du chargement des acteurs');
      }
    } catch (e) {
      // Lecture du cache en cas d’échec
      return await isar.acteurs.where().findAll();
    }
  }
}
