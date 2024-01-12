import 'package:flutter/material.dart';
import 'package:movie_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/movie/horizontal_movies_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(
      builder: (context, value, _) {
        return ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          children: [
            HorizontalMoviesListWidget(
              title: 'In Theaters',
              movies: value.nowPlayingMovies,
            ),
            const SizedBox(height: 16),
            HorizontalMoviesListWidget(
              title: 'Popular',
              movies: value.populargMovies,
            ),
            const SizedBox(height: 16),
            HorizontalMoviesListWidget(
              title: 'Top Rated',
              movies: value.topRatedMovies,
            ),
            const SizedBox(height: 16),
            HorizontalMoviesListWidget(
              title: 'Upcoming',
              movies: value.upcomingMovies,
            ),
          ],
        );
      },
    );
  }
}
