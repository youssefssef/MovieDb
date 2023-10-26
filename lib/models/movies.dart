class Movie {
  String title;
  String originalTitle;
  String backDropPath;
  String overview;
  String posterpath;
  String releaseDate;
  double voteAvarege;

  Movie({
    required this.title,
    required this.originalTitle,
    required this.backDropPath,
    required this.overview,
    required this.posterpath,
    required this.releaseDate,
    required this.voteAvarege,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["title"].toString(),
        originalTitle: json["original_title"].toString(),
        backDropPath: json["backdrop_path"].toString(),
        overview: json["overview"].toString(),
        posterpath: json["poster_path"].toString(),
        releaseDate: json["release_date"].toString(),
        voteAvarege: json["vote_average"].toDouble() ?? " ");
  }
}
