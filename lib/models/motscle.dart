class Motscle {
  String motcle;
  int motcleId;

  Motscle({required this.motcle, required this.motcleId});

  factory Motscle.fromJson(Map<String, dynamic> json) =>
      Motscle(motcle: json["motcle"], motcleId: json["motcle_id"]);

  Map<String, dynamic> toJson() => {"motcle": motcle, "motcle_id": motcleId};
}
