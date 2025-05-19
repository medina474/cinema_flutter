import 'dart:convert';

import 'api_client.dart';
import '../models/acteur.dart';

class ActeurService {
  final _client = ApiClient();

  Future<List<Acteur>> fetchActeurs() async {
    final response = await _client.get('/acteurs');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((json) => Acteur.fromJson(json)).toList();
    } else {
      throw Exception('Échec du chargement des acteurs');
    }
  }
}
