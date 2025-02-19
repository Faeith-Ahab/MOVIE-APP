import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/latestmovies_model.dart';


class LatestMoviesService {
  final String apiUrl = "https://api.themoviedb.org/3/movie/latest";
  final String apiKey = "1ef9420b1d1988fd82dee5eaf93285bd";

  Future<LatestMovie?> fetchLatestMovie() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?api_key=$apiKey'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return LatestMovie.fromJson(jsonData);
      } else {
        throw Exception('Failed to load latest movie: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching latest movie: $e');
      return null;
    }
  }
}

// Main function to test fetching the latest movie
void main() async {
  LatestMoviesService latestMoviesService = LatestMoviesService();

  print('Fetching the latest movie...');

  try {
    final latestMovie = await latestMoviesService.fetchLatestMovie();
    if (latestMovie != null) {
      print('Latest Movie fetched successfully:');
      print('Title: ${latestMovie.title}');
      print('Overview: ${latestMovie.overview}');
      print('Release Date: ${latestMovie.releaseDate}');
    } else {
      print('No latest movie found.');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}






// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/latestmovies_model.dart';
// import '../utils/constants.dart';   // reference to the constants


// class LatestMoviesService {
//   // final String apiUrl = "https://api.themoviedb.org/3/movie/latest";
//   // final String apiKey = "1ef9420b1d1988fd82dee5eaf93285bd";


//   // Future<LatestMovie?> fetchLatestMovie() async {
//   //   try {
//   //     final response = await http.get(Uri.parse('$apiUrl?api_key=$apiKey'));

//   <latestMovies>> fetchlatestMovies() async {
//     final url = '$apiUrl?api_key=$apiKey'; 
//     print('Requesting URL: $url');

//     try {
//       final response = await http.get(Uri.parse(url));
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');



//       // if (response.statusCode == 200) {
//       //   final jsonData = json.decode(response.body);
//       //   return LatestMovie.fromJson(jsonData);

//         if (response.statusCode == 200) {
//         final jsonResponse = json.decode(response.body);
//         final List<dynamic> LatestMoviesJson = jsonResponse['LatestMovies'];
//       } else {
//         throw Exception('Failed to load latest movie: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching latest movie: $e');
//       return null;
//     }
//   }
// }

// // Main function to test fetching the latest movies
// void main() async {
//   LatestMoviesService latestMoviesService = LatestMoviesService();

//   print('Fetching the latest movie...');

//   try {
//     final latestMovies = await latestMoviesService.fetchLatestMovie();
//     if (latestMovie != null) {
//       print('Latest Movie fetched successfully:');
//       print('Title: ${latestMovie.title}');
//       print('Overview: ${latestMovie.overview}');
//       print('Release Date: ${latestMovie.releaseDate}');
//     } else {
//       print('No latest movie found.');
//     }
//   } catch (e) {
//     print('An error occurred: $e');
//   }
// }
