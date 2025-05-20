import 'dart:convert';
import 'api_client.dart';
import '../models/etablissement.dart';

class ActeurService {
  final _client = ApiClient();

  Future<List<Feature>> fetch() async {
    final response = await _client.get(
      '/geojson/etablissements?bbox=7.3,48.3,8.2,48.8',
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return data["features"].map((json) => Feature.fromJson(json)).toList();
    } else {
      throw Exception('Échec du chargement des acteurs');
    }
  }
}
