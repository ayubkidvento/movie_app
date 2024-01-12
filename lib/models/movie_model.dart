// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class MovieModel {
  final String backdropPath;
  final int id;
  final String title;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final List<int> genreIds;
  final num popularity;
  final String releaseDate;
  final num voteAverage;
  final num voteCount;
  MovieModel({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieModel copyWith({
    bool? adult,
    String? backdropPath,
    int? id,
    String? title,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    String? posterPath,
    List<int>? genreIds,
    num? popularity,
    String? releaseDate,
    num? voteAverage,
    num? voteCount,
  }) =>
      MovieModel(
        backdropPath: backdropPath ?? this.backdropPath,
        id: id ?? this.id,
        title: title ?? this.title,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        posterPath: posterPath ?? this.posterPath,
        genreIds: genreIds ?? this.genreIds,
        popularity: popularity ?? this.popularity,
        releaseDate: releaseDate ?? this.releaseDate,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  factory MovieModel.fromMap(Map<String, dynamic> map) => MovieModel(
        backdropPath: map['backdrop_path'] ?? map['poster_path'],
        id: map['id'],
        title: map['title'] ?? map['name'],
        originalLanguage: map['original_language'],
        originalTitle: map['original_title'] ?? map['original_name'],
        overview: map['overview'],
        posterPath: map['poster_path'] ?? map['backdrop_path'],
        genreIds: List<int>.from(map['genre_ids']),
        popularity: map['popularity'],
        releaseDate: map['release_date'] ?? map['first_air_date'] ?? '',
        voteAverage: map['vote_average'],
        voteCount: map['vote_count'],
      );

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MovieModel( backdropPath: $backdropPath, id: $id, title: $title, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, posterPath: $posterPath, genreIds: $genreIds, popularity: $popularity, releaseDate: $releaseDate, voteAverage: $voteAverage, voteCount: $voteCount)';

  @override
  bool operator ==(covariant MovieModel other) {
    if (identical(this, other)) return true;

    return other.backdropPath == backdropPath &&
        other.id == id &&
        other.title == title &&
        other.originalLanguage == originalLanguage &&
        other.originalTitle == originalTitle &&
        other.overview == overview &&
        other.posterPath == posterPath &&
        listEquals(other.genreIds, genreIds) &&
        other.popularity == popularity &&
        other.releaseDate == releaseDate &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount;
  }

  @override
  int get hashCode =>
      backdropPath.hashCode ^
      id.hashCode ^
      title.hashCode ^
      originalLanguage.hashCode ^
      originalTitle.hashCode ^
      overview.hashCode ^
      posterPath.hashCode ^
      genreIds.hashCode ^
      popularity.hashCode ^
      releaseDate.hashCode ^
      voteAverage.hashCode ^
      voteCount.hashCode;
}
