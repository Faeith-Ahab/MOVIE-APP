import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/popularmovies_model.dart';

class PopularMoviesService {
  final String apiUrl = "https://api.themoviedb.org/3/movie/popular";
  final String apiKey = "1ef9420b1d1988fd82dee5eaf93285bd";

  Future<List<PopularMovie>> fetchPopularMovies() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?api_key=$apiKey'));

      if (response.statusCode == 200) {
        final List<dynamic> moviesJson = json.decode(response.body)['results'];
        return moviesJson.map((json) => PopularMovie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load popular movies: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching popular movies: $e');
      return [];
    }
  }
}

void main() async {
  PopularMoviesService popularMoviesService = PopularMoviesService();

  print('Fetching popular movies...');

  try {
    final movies = await popularMoviesService.fetchPopularMovies();
    if (movies.isNotEmpty) {
      print('Popular Movies fetched successfully:');
      for (var movie in movies) {
        print('Title: ${movie.title}');
      }
    } else {
      print('No popular movies found.');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
