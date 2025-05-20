import 'dart:convert';
import 'api_client.dart';
import '../models/film.dart';

class FilmService {
  final _client = ApiClient();

  Future<Film> fetch() async {
    final response = await _client.get(
      '/films?film_id=eq.1368&select=*,resumes(resume),equipes(role, alias, ordre, personnes(personne_id, prenom, nom, artiste)),votes(votants, moyenne),genres(*),motscles(*),series(*),societes(societe_id, societe)',
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((json) => Film.fromJson(json)).first;
    } else {
      throw Exception('Échec du chargement des acteurs');
    }
  }
}
