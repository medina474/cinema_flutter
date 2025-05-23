import 'dart:convert';
import 'package:flutter_map/flutter_map.dart';

import 'api_client.dart';
import '../carte/etablissement.dart';

class EtablissementService {
  final _client = ApiClient(port: 3002);

  Future<List<Feature>> fetch(LatLngBounds bounds) async {
    final response = await _client.get(
      '/geojson/etablissements?bbox=${bounds.northWest.longitude},${bounds.northWest.latitude},${bounds.southEast.longitude},${bounds.southEast.latitude}',
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      return List<Feature>.from(
        data["features"].map((x) => Feature.fromJson(x)),
      );
    } else {
      throw Exception('Échec du chargement des acteurs');
    }
  }
}
