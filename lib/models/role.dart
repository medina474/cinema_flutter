import 'dart:convert';

import 'package:cinema/models/genre.dart';

Role roleFromJson(String str) => Role.fromJson(json.decode(str));

String roleToJson(Role data) => json.encode(data.toJson());

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

  Map<String, dynamic> toJson() => {
    "alias": alias,
    "role": role,
    "films": films.toJson(),
  };
}

class Films {
  int filmId;
  String titre;
  int? annee;
  int duree;
  List<Genre> genres;

  Films({
    this.annee,
    required this.titre,
    required this.filmId,
    required this.duree,
    required this.genres,
  });

  factory Films.fromJson(Map<String, dynamic> json) => Films(
    filmId: json["film_id"],
    titre: json["titre"],
    annee: json["annee"],
    duree: json["duree"],
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "annee": annee,
    "titre": titre,
    "film_id": filmId,
  };
}
