class Genre {
  String genre;
  int genreId;

  Genre({required this.genre, required this.genreId});

  factory Genre.fromJson(Map<String, dynamic> json) =>
      Genre(genre: json["genre"], genreId: json["genre_id"]);

  Map<String, dynamic> toJson() => {"genre": genre, "genre_id": genreId};
}
