class ProductionCompany {
  final String name;
  final String? logoUrl;
  final String? country;

  ProductionCompany({
    required this.name,
    this.logoUrl,
    this.country,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      name: json['name'] ?? 'Unknown',  // Handle missing name
      logoUrl: json['logo_path'] != null
          ? 'https://image.tmdb.org/t/p/w500${json['logo_path']}'  // Build full URL if logo exists
          : null,  // Handle null logo path
      country: json['origin_country'] ?? 'Unknown',  // Handle missing country
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'logo_url': logoUrl,
      'country': country,
    };
  }
}
