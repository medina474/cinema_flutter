// To parse this JSON data, do
//
//     final features = featuresFromJson(jsonString);

import 'dart:convert';

Features featuresFromJson(String str) => Features.fromJson(json.decode(str));

String featuresToJson(Features data) => json.encode(data.toJson());

class Features {
  String type;
  List<Feature> features;

  Features({required this.type, required this.features});

  factory Features.fromJson(Map<String, dynamic> json) => Features(
    type: json["type"],
    features: List<Feature>.from(
      json["features"].map((x) => Feature.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "features": List<dynamic>.from(features.map((x) => x.toJson())),
  };
}

class Feature {
  FeatureType type;
  int id;
  Properties properties;
  Geometry geometry;

  Feature({
    required this.type,
    required this.id,
    required this.properties,
    required this.geometry,
  });

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    type: featureTypeValues.map[json["type"]]!,
    id: json["id"],
    properties: Properties.fromJson(json["properties"]),
    geometry: Geometry.fromJson(json["geometry"]),
  );

  Map<String, dynamic> toJson() => {
    "type": featureTypeValues.reverse[type],
    "id": id,
    "properties": properties.toJson(),
    "geometry": geometry.toJson(),
  };
}

class Geometry {
  GeometryType type;
  List<double> coordinates;

  Geometry({required this.type, required this.coordinates});

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    type: geometryTypeValues.map[json["type"]]!,
    coordinates: List<double>.from(
      json["coordinates"].map((x) => x?.toDouble()),
    ),
  );

  Map<String, dynamic> toJson() => {
    "type": geometryTypeValues.reverse[type],
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

enum GeometryType { POINT }

final geometryTypeValues = EnumValues({"Point": GeometryType.POINT});

class Properties {
  String nom;
  String voie;
  dynamic codepostal;
  String ville;
  int ecrans;
  int fauteuils;
  /*
  dynamic createdAt;
  dynamic updatedAt;
  */

  Properties({
    required this.nom,
    required this.voie,
    required this.codepostal,
    required this.ville,
    required this.ecrans,
    required this.fauteuils,
    /*
    required this.createdAt,
    required this.updatedAt,
    */
  });

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    nom: json["nom"],
    voie: json["voie"],
    codepostal: json["codepostal"],
    ville: json["ville"],
    ecrans: json["ecrans"],
    fauteuils: json["fauteuils"],
    /*
    createdAt: createdAtValues.map[json["created_at"]]!,
    updatedAt: json["updated_at"],
    */
  );

  Map<String, dynamic> toJson() => {
    "nom": nom,
    "voie": voie,
    "codepostal": codepostal,
    "ville": ville,
    "ecrans": ecrans,
    "fauteuils": fauteuils,
    /*
    "created_at": createdAtValues.reverse[createdAt],
    "updated_at": updatedAt,
    */
  };
}

/*
enum CreatedAt { THE_2025051923255780997302 }

final createdAtValues = EnumValues({
  "2025-05-19 23:25:57.809973+02": CreatedAt.THE_2025051923255780997302,
});
*/

enum FeatureType { FEATURE }

final featureTypeValues = EnumValues({"Feature": FeatureType.FEATURE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
