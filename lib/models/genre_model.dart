// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GenreModel {
  final int id;
  final String name;
  GenreModel({
    required this.id,
    required this.name,
  });

  GenreModel copyWith({int? id, String? name}) =>
      GenreModel(id: id ?? this.id, name: name ?? this.name);

  factory GenreModel.fromMap(Map<String, dynamic> map) => GenreModel(
        id: map['id'],
        name: map['name'],
      );

  factory GenreModel.fromJson(String source) =>
      GenreModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GenreModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant GenreModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
