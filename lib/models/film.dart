// To parse this JSON data, do
//
//     final film = filmFromJson(jsonString);

import 'dart:convert';

import 'package:cinema/models/genre.dart';
import 'package:cinema/models/motscle.dart';

Film filmFromJson(String str) => Film.fromJson(json.decode(str));

String filmToJson(Film data) => json.encode(data.toJson());

class Film {
  int filmId;
  String titre;
  String titreOriginal;
  int annee;
  DateTime sortie;
  int duree;
  int serieId;
  String slogan;
  List<String> pays;
  DateTime createdAt;
  dynamic updatedAt;
  List<Resume> resumes;
  List<Equipe> equipes;
  List<Vote> votes;
  List<Genre> genres;
  List<Motscle> motscles;
  Series series;
  List<Societe> societes;

  Film({
    required this.filmId,
    required this.titre,
    required this.titreOriginal,
    required this.annee,
    required this.sortie,
    required this.duree,
    required this.serieId,
    required this.slogan,
    required this.pays,
    required this.createdAt,
    required this.updatedAt,
    required this.resumes,
    required this.equipes,
    required this.votes,
    required this.genres,
    required this.motscles,
    required this.series,
    required this.societes,
  });

  factory Film.fromJson(Map<String, dynamic> json) => Film(
    filmId: json["film_id"],
    titre: json["titre"],
    titreOriginal: json["titre_original"],
    annee: json["annee"],
    sortie: DateTime.parse(json["sortie"]),
    duree: json["duree"],
    serieId: json["serie_id"],
    slogan: json["slogan"],
    pays: List<String>.from(json["pays"].map((x) => x)),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    resumes: List<Resume>.from(json["resumes"].map((x) => Resume.fromJson(x))),
    equipes: List<Equipe>.from(json["equipes"].map((x) => Equipe.fromJson(x))),
    votes: List<Vote>.from(json["votes"].map((x) => Vote.fromJson(x))),
    genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
    motscles: List<Motscle>.from(
      json["motscles"].map((x) => Motscle.fromJson(x)),
    ),
    series: Series.fromJson(json["series"]),
    societes: List<Societe>.from(
      json["societes"].map((x) => Societe.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "film_id": filmId,
    "titre": titre,
    "titre_original": titreOriginal,
    "annee": annee,
    "sortie":
        "${sortie.year.toString().padLeft(4, '0')}-${sortie.month.toString().padLeft(2, '0')}-${sortie.day.toString().padLeft(2, '0')}",
    "duree": duree,
    "serie_id": serieId,
    "slogan": slogan,
    "pays": List<dynamic>.from(pays.map((x) => x)),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "resumes": List<dynamic>.from(resumes.map((x) => x.toJson())),
    "equipes": List<dynamic>.from(equipes.map((x) => x.toJson())),
    "votes": List<dynamic>.from(votes.map((x) => x.toJson())),
    "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
    "motscles": List<dynamic>.from(motscles.map((x) => x.toJson())),
    "series": series.toJson(),
    "societes": List<dynamic>.from(societes.map((x) => x.toJson())),
  };
}

class Equipe {
  String role;
  String? alias;
  int ordre;
  Personnes personnes;

  Equipe({
    required this.role,
    required this.alias,
    required this.ordre,
    required this.personnes,
  });

  factory Equipe.fromJson(Map<String, dynamic> json) => Equipe(
    role: json["role"],
    alias: json["alias"],
    ordre: json["ordre"],
    personnes: Personnes.fromJson(json["personnes"]),
  );

  Map<String, dynamic> toJson() => {
    "role": role,
    "alias": alias,
    "ordre": ordre,
    "personnes": personnes.toJson(),
  };
}

class Personnes {
  String nom;
  String prenom;
  dynamic artiste;
  int personneId;

  Personnes({
    required this.nom,
    required this.prenom,
    required this.artiste,
    required this.personneId,
  });

  factory Personnes.fromJson(Map<String, dynamic> json) => Personnes(
    nom: json["nom"],
    prenom: json["prenom"],
    artiste: json["artiste"],
    personneId: json["personne_id"],
  );

  Map<String, dynamic> toJson() => {
    "nom": nom,
    "prenom": prenom,
    "artiste": artiste,
    "personne_id": personneId,
  };
}

class Resume {
  String resume;

  Resume({required this.resume});

  factory Resume.fromJson(Map<String, dynamic> json) =>
      Resume(resume: json["resume"]);

  Map<String, dynamic> toJson() => {"resume": resume};
}

class Series {
  String serie;
  int serieId;

  Series({required this.serie, required this.serieId});

  factory Series.fromJson(Map<String, dynamic> json) =>
      Series(serie: json["serie"], serieId: json["serie_id"]);

  Map<String, dynamic> toJson() => {"serie": serie, "serie_id": serieId};
}

class Societe {
  String societe;
  int societeId;

  Societe({required this.societe, required this.societeId});

  factory Societe.fromJson(Map<String, dynamic> json) =>
      Societe(societe: json["societe"], societeId: json["societe_id"]);

  Map<String, dynamic> toJson() => {
    "societe": societe,
    "societe_id": societeId,
  };
}

class Vote {
  double moyenne;
  int votants;

  Vote({required this.moyenne, required this.votants});

  factory Vote.fromJson(Map<String, dynamic> json) =>
      Vote(moyenne: json["moyenne"]?.toDouble(), votants: json["votants"]);

  Map<String, dynamic> toJson() => {"moyenne": moyenne, "votants": votants};
}
