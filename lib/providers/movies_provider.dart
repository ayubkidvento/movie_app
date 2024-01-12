import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/services/movie_service.dart';

class MoviesProvider extends ChangeNotifier {
  List<MovieModel> _discoverMovies = [];
  List<MovieModel> get discoverMovies => _discoverMovies;
  List<MovieModel> _discoverTvs = [];
  List<MovieModel> get discoverTvs => _discoverTvs;
  List<MovieModel> _nowPlayingMovies = [];
  List<MovieModel> get nowPlayingMovies => _nowPlayingMovies;
  List<MovieModel> _popularMovies = [];
  List<MovieModel> get populargMovies => _popularMovies;
  List<MovieModel> _topRatedMovies = [];
  List<MovieModel> get topRatedMovies => _topRatedMovies;
  List<MovieModel> _upcomingMovies = [];
  List<MovieModel> get upcomingMovies => _upcomingMovies;

  // dicover movies
  _discoverList({bool isTv = false}) async {
    var res = await movieService.getDiscover(isTv: isTv);
    if (isTv) {
      _discoverTvs = res;
    } else {
      _discoverMovies = res;
    }
    notifyListeners();
  }

  _nowPlayingMoviesList() async {
    var res = await movieService.getNowPlayingMovies();
    _nowPlayingMovies = res;
    notifyListeners();
  }

  _getPopularMoviesList() async {
    var res = await movieService.getPopularMovies();
    _popularMovies = res;
    notifyListeners();
  }

  _getTopRatedMoviesList() async {
    var res = await movieService.getTopRatedMovies();
    _topRatedMovies = res;
    notifyListeners();
  }

  _getUpcomingMoviesList() async {
    var res = await movieService.getUpcomingMovies();
    _upcomingMovies = res;
    notifyListeners();
  }

  MoviesProvider() {
    _discoverList();
    _discoverList(isTv: true);
    _nowPlayingMoviesList();
    _getPopularMoviesList();
    _getTopRatedMoviesList();
    _getUpcomingMoviesList();
  }
}
