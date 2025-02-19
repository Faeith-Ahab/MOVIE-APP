class LatestMovie {
  final int id;
  final String title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final String releaseDate;
  final double? voteAverage;
  final int voteCount;

  LatestMovie({
    required this.id,
    required this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    required this.releaseDate,
    this.voteAverage,
    required this.voteCount,
  });

  factory LatestMovie.fromJson(Map<String, dynamic> json) {
    return LatestMovie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date'] ?? '',
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] ?? 0,
    );
  }
}
