// import 'dart:convert'; 
// import 'package:http/http.dart' as http;
// import '../models/productioncompany_model.dart';

// class ProductionCompanyService {
//   final String apiUrl = "https://api.themoviedb.org/3/movie";
//   final String searchUrl = "https://api.themoviedb.org/3/search/movie";
//   final String apiKey = "1ef9420b1d1988fd82dee5eaf93285bd";

//   // Fetch production companies for a specific movie
//   Future<List<ProductionCompany>> fetchProductionCompanies(int movieId) async {
//     try {
//       final response = await http.get(Uri.parse('$apiUrl/$movieId?api_key=$apiKey'));

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         final List<dynamic> companiesJson = jsonData['production_companies'] ?? [];

//         return companiesJson.map((json) => ProductionCompany.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed to load production companies: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching production companies: $e');
//       return [];
//     }
//   }

//   // Fetch the movie ID for "Spider-Man: Across the Spider-Verse"
//   Future<int?> getMovieId(String movieName) async {
//     try {
//       final response = await http.get(Uri.parse('$searchUrl?query=$movieName&api_key=$apiKey'));

//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         final results = jsonData['results'] as List;
//         if (results.isNotEmpty) {
//           final movieId = results[0]['id'];
//           return movieId;
//         } else {
//           throw Exception('Movie not found');
//         }
//       } else {
//         throw Exception('Failed to search for movie: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching movie ID: $e');
//       return null;
//     }
//   }
// }

// // Main function to test fetching production companies for Spider-Man: Across the Spider-Verse
// void main() async {
//   ProductionCompanyService productionCompanyService = ProductionCompanyService();
  
//   // Get the movie ID for Spider-Man: Across the Spider-Verse
//   final movieId = await productionCompanyService.getMovieId('Spider-Man: Across the Spider-Verse');

//   if (movieId != null) {
//     print('Fetching production companies for movie ID: $movieId...');

//     try {
//       final companies = await productionCompanyService.fetchProductionCompanies(movieId);
//       if (companies.isNotEmpty) {
//         print('Production Companies fetched successfully:');
//         for (var company in companies) {
//           print('Name: ${company.name}');
//           print('Country: ${company.country}');
//           print('Logo URL: ${company.logoUrl ?? 'No logo available'}\n');
//         }
//       } else {
//         print('No production companies found.');
//       }
//     } catch (e) {
//       print('An error occurred: $e');
//     }
//   } else {
//     print('Spider-Man: Across the Spider-Verse not found.');
//   }
// }






import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/productioncompany_model.dart';

class ProductionCompanyService {
  final String apiUrl = "https://api.themoviedb.org/3/movie";
  final String apiKey = "1ef9420b1d1988fd82dee5eaf93285bd";

  // Fetch production companies for a specific movie
  Future<List<ProductionCompany>> fetchProductionCompanies(int movieId) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/$movieId?api_key=$apiKey'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List<dynamic> companiesJson = jsonData['production_companies'] ?? [];

        return companiesJson.map((json) => ProductionCompany.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load production companies: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching production companies: $e');
      return [];
    }
  }
}

// Main function to test fetching production companies
void main() async {
  ProductionCompanyService productionCompanyService = ProductionCompanyService();
  int movieId = 569094; // Example: Spiderman across the spider verse

  print('Fetching production companies...');

  try {
    final companies = await productionCompanyService.fetchProductionCompanies(movieId);
    if (companies.isNotEmpty) {
      print('Production Companies fetched successfully:');
      for (var company in companies) {
        print('Name: ${company.name}');
        print('Country: ${company.country}');
        print('Logo URL: ${company.logoUrl ?? 'No logo available'}\n');
      }
    } else {
      print('No production companies found.');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
