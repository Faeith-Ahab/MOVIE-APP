// lib/services/genre_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/genre_model.dart';
import '../utils/constants.dart';

class GenreService {
  Future<List<Genre>> fetchGenres() async {
    final url = '$apiUrl?api_key=$apiKey'; 
    print('Requesting URL: $url');

    try {
      final response = await http.get(Uri.parse(url));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> genreJson = jsonResponse['genres'];
        return genreJson.map((json) => Genre.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load genres: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching genres: $e');
      return [];
    }
  }
}

// Main function to test the service independently
void main() async {
  GenreService genreService = GenreService();

  print('Fetching genres...');

  try {
    final genres = await genreService.fetchGenres();
    if (genres.isNotEmpty) {
      print('Genres fetched successfully:');
      for (var genre in genres) {
        print('Genre: ${genre.name}');
      }
    } else {
      print('No genres found.');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
