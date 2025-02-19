// import 'package:app/models/actors_model.dart';

// // import 'package:movie_app/models/reviews_model.dart';

// class Movie {
//   final String title;
//   final String description;
//   final String releaseDate;
//   final List<String> genres;
//   final String posterUrl;
//   final double rating;
//   final int runtime;
//   final String language;
//   final String director;
//   final List<Actor> actors;
//   // final List<Review> reviews;

//   Movie({
//     required this.title,
//     required this.description,
//     required this.releaseDate,
//     required this.genres,
//     required this.posterUrl,
//     required this.rating,
//     required this.runtime,
//     required this.language,
//     required this.director,
//     required this.actors,
//     // required this.reviews,
//   });

//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//       title: json['title'],
//       description: json['description'],
//       releaseDate: json['release_date'],
//       genres: List<String>.from(json['genres']),
//       posterUrl: json['poster_url'],
//       rating: json['rating'].toDouble(),
//       runtime: json['runtime'],
//       language: json['language'],
//       director: json['director'],
//       actors: (json['actors'] as List)
//           .map((actorJson) => Actor.fromJson(actorJson))
//           .toList(),
//       // reviews: (json['reviews'] as List)
//           // .map((reviewJson) => Review.fromJson(reviewJson))
//           // .toList(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'description': description,
//       'release_date': releaseDate,
//       'genres': genres,
//       'poster_url': posterUrl,
//       'rating': rating,
//       'runtime': runtime,
//       'language': language,
//       'director': director,
//       'actors': actors.map((actor) => actor.toJson()).toList(),
//       // 'reviews': reviews.map((review) => review.toJson()).toList(),
//     };
//   }
// }


class Movie {
  final int id;
  final String title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final String releaseDate;
  final double? voteAverage;
  final int voteCount;
  final List<int> genreIds;
  final bool adult;
  final bool video;
  final double? popularity;

  Movie({
    required this.id,
    required this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    required this.releaseDate,
    this.voteAverage,
    required this.voteCount,
    required this.genreIds,
    required this.adult,
    required this.video,
    this.popularity,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date'] ?? '',
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: json['vote_count'] ?? 0,
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      adult: json['adult'] ?? false,
      video: json['video'] ?? false,
      popularity: (json['popularity'] as num?)?.toDouble(),
    );
  }
}