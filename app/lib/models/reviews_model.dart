class Review {
  final String author;
  final String content;
  final String? url;
  final String? createdAt;

  Review({
    required this.author,
    required this.content,
    this.url,
    this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      author: json['author'] ?? 'Anonymous',
      content: json['content'] ?? '',
      url: json['url'],
      createdAt: json['created_at'],
    );
  }
}
