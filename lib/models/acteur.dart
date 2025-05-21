import 'dart:convert';

class Acteur {
  int personneId;
  String nom;
  String metaphone;
  DateTime? naissance;
  int? age;
  DateTime? deces;
  String? nationalite;
  String? drapeauUnicode;
  int nbFilm;
  double popularite;

  Acteur({
    required this.personneId,
    required this.nom,
    required this.metaphone,
    this.naissance,
    this.age,
    this.deces,
    this.nationalite,
    this.drapeauUnicode,
    required this.nbFilm,
    required this.popularite,
  });

  factory Acteur.fromJson(Map<String, dynamic> json) => Acteur(
    personneId: json["personne_id"],
    nom: json["nom"],
    metaphone: json["metaphone"],
    naissance:
        json["naissance"] != null ? DateTime.parse(json["naissance"]) : null,
    age: json["age"],
    deces: json["deces"] != null ? DateTime.parse(json["deces"]) : null,
    nationalite: json["nationalite"],
    drapeauUnicode: json["drapeau_unicode"],
    nbFilm: json["nb_film"],
    popularite: json["popularite"]?.toDouble(),
  );
}
