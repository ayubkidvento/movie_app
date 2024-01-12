import 'dart:developer';

import 'package:movie_app/models/movie_model.dart';

import '../config/api_constant.dart';
import '../models/genre_model.dart';
import '../services/dio_service.dart';

class MovieService {
  // get discover movies/tv
  Future<List<MovieModel>> getDiscover({bool isTv = false}) async {
    try {
      var res =
          await dioService.dio.get(isTv ? discoverTvUrl : discoverMovieUrl);
      return res.data['results']
          .map<MovieModel>((e) => MovieModel.fromMap(e))
          .toList();
    } catch (e) {
      log('ERROR $e');
      rethrow;
    }
  }

  // get list of genres
  Future<List<GenreModel>> getGenresList({bool isTv = false}) async {
    try {
      var res = await dioService.dio.get(isTv ? tvGenreUrl : movieGenreUrl);
      return res.data['genres']
          .map<GenreModel>((e) => GenreModel.fromMap(e))
          .toList();
    } catch (e) {
      log('ERROR $e');
      rethrow;
    }
  }

  // get movies by genre
  Future<List<MovieModel>> getMoviesByGenre(
    int id, {
    bool isTv = false,
  }) async {
    try {
      var res = await dioService.dio.get(
        isTv ? discoverTvUrl : discoverMovieUrl,
        queryParameters: {
          'with_genres': id.toString(),
        },
      );
      return res.data['results']
          .map<MovieModel>((e) => MovieModel.fromMap(e))
          .toList();
    } catch (e) {
      log('ERROR $e');
      rethrow;
    }
  }

  // now playing movies
  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      var res = await dioService.dio.get(nowPlayingMovieUrl);
      return res.data['results']
          .map<MovieModel>((e) => MovieModel.fromMap(e))
          .toList();
    } catch (e) {
      log('ERROR $e');
      rethrow;
    }
  }

  // popular movies
  Future<List<MovieModel>> getPopularMovies() async {
    try {
      var res = await dioService.dio.get(popularMovieUrl);
      return res.data['results']
          .map<MovieModel>((e) => MovieModel.fromMap(e))
          .toList();
    } catch (e) {
      log('ERROR $e');
      rethrow;
    }
  }

  // top rated movies list
  Future<List<MovieModel>> getTopRatedMovies() async {
    try {
      var res = await dioService.dio.get(topRatedMovieUrl);
      return res.data['results']
          .map<MovieModel>((e) => MovieModel.fromMap(e))
          .toList();
    } catch (e) {
      log('ERROR $e');
      rethrow;
    }
  }

  // upcoming movies list
  Future<List<MovieModel>> getUpcomingMovies() async {
    try {
      var res = await dioService.dio.get(upcomingMovieUrl);
      return res.data['results']
          .map<MovieModel>((e) => MovieModel.fromMap(e))
          .toList();
    } catch (e) {
      log('ERROR $e');
      rethrow;
    }
  }
}

final movieService = MovieService();
