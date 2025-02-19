class UserRating {
  final String username;
  final double rating;
  final String review;
  final String date;

  UserRating({
    required this.username,
    required this.rating,
    required this.review,
    required this.date,
  });

  factory UserRating.fromJson(Map<String, dynamic> json) {
    return UserRating(
      username: json['username'],
      rating: json['rating'].toDouble(),
      review: json['review'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'rating': rating,
      'review': review,
      'date': date,
    };
  }
}
