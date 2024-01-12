import 'package:flutter/material.dart';

import '../models/genre_model.dart';
import '../models/movie_model.dart';
import '../services/movie_service.dart';

class GenreProvider extends ChangeNotifier {
  GenreModel? _selectedMovieGenre;
  GenreModel? get selectedMovieGenre => _selectedMovieGenre;
  GenreModel? _selectedTvGenre;
  GenreModel? get selectedTvGenre => _selectedTvGenre;
  List<GenreModel> _moviesGenres = [];
  List<GenreModel> get moviesGenres => _moviesGenres;
  List<GenreModel> _tvGenres = [];
  List<GenreModel> get tvGenres => _tvGenres;

  List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  GenreProvider() {
    _getGenreList();
    _getGenreList(isTv: true);
  }

  // get movies list
  _getMoviesList(int id, bool isTv) async {
    var res = await movieService.getMoviesByGenre(id, isTv: isTv);
    _movies = res;
    notifyListeners();
  }

  // get genres list
  _getGenreList({bool isTv = false}) async {
    var res = await movieService.getGenresList(isTv: isTv);
    if (isTv) {
      _tvGenres = res;
    } else {
      _moviesGenres = res;
    }
    notifyListeners();
  }

  // update genre
  updateGenre(bool isTv, GenreModel x) {
    if (isTv) {
      if (_selectedTvGenre != null) {
        if (x.id == _selectedTvGenre!.id) {
          _selectedTvGenre = null;
        } else {
          _selectedTvGenre = x;
        }
      } else {
        _selectedTvGenre = x;
      }
    } else {
      if (_selectedMovieGenre != null) {
        if (x.id == _selectedMovieGenre!.id) {
          _selectedMovieGenre = null;
        } else {
          _selectedMovieGenre = x;
        }
      } else {
        _selectedMovieGenre = x;
      }
    }
    notifyListeners();
    _getMoviesList(x.id, isTv);
  }
}
