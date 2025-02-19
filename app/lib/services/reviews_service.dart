import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/reviews_model.dart';

class ReviewService {
  final String apiUrl = "https://api.themoviedb.org/3/movie";
  final String apiKey = "1ef9420b1d1988fd82dee5eaf93285bd";

  // Fetch reviews for a specific movie
  Future<List<Review>> fetchReviews(int movieId) async {
    try {
      final response =
          await http.get(Uri.parse('$apiUrl/$movieId/reviews?api_key=$apiKey'));

      if (response.statusCode == 200) {
        final List<dynamic> reviewsJson = json.decode(response.body)['results'];
        return reviewsJson.map((json) => Review.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load reviews: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching reviews: $e');
      return [];
    }
  }
}

// Main function to test fetching reviews
void main() async {
  ReviewService reviewService = ReviewService();

  print('Fetching reviews...');

  try {
    final reviews = await reviewService.fetchReviews(569094); // Example: Spiderman across the spider verse
    if (reviews.isNotEmpty) {
      print('Reviews fetched successfully:');
      for (var review in reviews) {
        print('Author: ${review.author}');
        print('Review: ${review.content}\n');
      }
    } else {
      print('No reviews found.');
    }
  } catch (e) {
    print('An error occurred: $e');
  }
}
