import 'dart:convert';

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
  int? annee;
  String titre;
  int filmId;

  Films({this.annee, required this.titre, required this.filmId});

  factory Films.fromJson(Map<String, dynamic> json) => Films(
    annee: json["annee"],
    titre: json["titre"],
    filmId: json["film_id"],
  );

  Map<String, dynamic> toJson() => {
    "annee": annee,
    "titre": titre,
    "film_id": filmId,
  };
}
