class Actor {
  final String name;
  final String characterName;
  final String profilePictureUrl;

  Actor({
    required this.name,
    required this.characterName,
    required this.profilePictureUrl,
  });

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      name: json['name'],
      characterName: json['character_name'],
      profilePictureUrl: json['profile_picture_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'character_name': characterName,
      'profile_picture_url': profilePictureUrl,
    };
  }
}