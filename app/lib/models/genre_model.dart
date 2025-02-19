// class Genre {
//   final String name;
//   final String description;

//   Genre({
//     required this.name,
//     required this.description,
//   });

//   factory Genre.fromJson(Map<String, dynamic> json) {
//     return Genre(
//       name: json['name'],
//       description: json['description'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'description': description,
//     };
//   }
// }


import 'package:json_annotation/json_annotation.dart';
part 'genre_model.g.dart';

@JsonSerializable()
class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}