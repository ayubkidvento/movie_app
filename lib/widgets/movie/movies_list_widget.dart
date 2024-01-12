import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../models/movie_model.dart';
import 'movie_card_widget.dart';

class MoviesListWidget extends StatelessWidget {
  final List<MovieModel> movies;
  const MoviesListWidget({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        children: movies.map((e) => MovieCardWidget(movie: e)).toList(),
      ),
    );
  }
}
