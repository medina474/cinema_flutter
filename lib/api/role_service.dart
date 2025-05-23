import 'dart:convert';
import 'package:flutter/material.dart';
import 'api_client.dart';
import '../models/role.dart';

class RoleService {
  final _client = ApiClient();

  Future<List<Role>> fetch(int acteurId) async {
    final response = await _client.get(
      '/equipes?personne_id=eq.$acteurId&role=eq.acteur&select=alias,role,films(film_id, titre, annee, duree, genres(*),votes(*))',
    );
    if (response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body) as List;
        return data.map((json) => Role.fromJson(json)).toList();
      } catch (e, stack) {
        debugPrint("Erreur de parsing : $e");
        debugPrint("$stack");
        return [];
      }
    } else {
      throw Exception('Échec du chargement des acteurs');
    }
  }
}
