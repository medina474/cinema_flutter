import 'dart:convert';

import 'package:cinema/models/genre.dart';

class Role {
  String alias;
  String role;
  Films films;

  Role({required this.alias, required this.role, required this.films});

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    alias: json["alias"],
    role: json["role"],
    films: Films.fromJson(json["films"]),
  );
}

class Films {
  int filmId;
  String titre;
  int? annee;
  int duree;
  double moyenne;
  double votants;
  List<Genre> genres;

  Films({
    this.annee,
    required this.titre,
    required this.filmId,
    required this.duree,
    required this.genres,
    required this.moyenne,
    required this.votants,
  });

  factory Films.fromJson(Map<String, dynamic> json) => Films(
    filmId: json["film_id"],
    titre: json["titre"],
    annee: json["annee"],
    duree: json["duree"],
    moyenne: json["votes"][0]["moyenne"],
    votants: json["votes"][0]["votants"],
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
  );
}
