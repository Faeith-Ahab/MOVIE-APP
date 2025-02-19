// class PopularMovie {
//   final int id;
//   final String title;
//   final String? overview;
//   final String? posterPath;
//   final String? backdropPath;
//   final String releaseDate;
//   final double? voteAverage;
//   final int voteCount;
//   final double? popularity;

//   PopularMovie({
//     required this.id,
//     required this.title,
//     this.overview,
//     this.posterPath,
//     this.backdropPath,
//     required this.releaseDate,
//     this.voteAverage,
//     required this.voteCount,
//     this.popularity,
//   });

//   factory PopularMovie.fromJson(Map<String, dynamic> json) {
//     return PopularMovie(
//       id: json['id'],
//       title: json['title'],
//       overview: json['overview'],
//       posterPath: json['poster_path'],
//       backdropPath: json['backdrop_path'],
//       releaseDate: json['release_date'] ?? '',
//       voteAverage: (json['vote_average'] as num?)?.toDouble(),
//       voteCount: json['vote_count'] ?? 0,
//       popularity: (json['popularity'] as num?)?.toDouble(),
//     );
//   }
// }

class PopularMovie {
  final int id;
  final String title;
  final String? overview;
  final String? posterPath;
  final String releaseDate;

  PopularMovie({
    required this.id,
    required this.title,
    this.overview,
    this.posterPath,
    required this.releaseDate,
  });

  factory PopularMovie.fromJson(Map<String, dynamic> json) {
    return PopularMovie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'] ?? '',
    );
  }
}
