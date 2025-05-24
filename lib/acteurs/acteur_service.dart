import 'dart:convert';
import '../api/api_client.dart';
import 'acteur_model.dart';

class ActeurService {
  ActeurService();

  final _client = ApiClient();

  Future<List<Acteur>> fetch() async {
    try {
      final response = await _client.get('/acteurs');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        final acteurs =
            data.map<Acteur>((json) => Acteur.fromJson(json)).toList();
        return acteurs;
      } else {
        throw Exception('Échec du chargement des acteurs');
      }
    } catch (e) {
      // Lecture du cache en cas d’échec
      return [];
    }
  }
}
