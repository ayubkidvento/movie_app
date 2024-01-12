import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/genre_provider.dart';
import '../widgets/movie/movies_filter_bottombar_widget.dart';
import '../widgets/movie/movies_list_widget.dart';

class GenreScreen extends StatelessWidget {
  const GenreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ).copyWith(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Filter Movies/TV by Genre',
                style: TextStyle(
                  fontSize: 16,
                  height: 1,
                  fontWeight: FontWeight.w500,
                ),
              ),
              OutlinedButton.icon(
                onPressed: () => moviesFilterBottombarWidget(context),
                icon: const Icon(Icons.filter, size: 18),
                label: const Text('Filter'),
              ),
            ],
          ),
        ),
        Expanded(
          child: Consumer<GenreProvider>(
            builder: (context, x, _) =>
                x.selectedMovieGenre == null && x.selectedTvGenre == null
                    ? const Center(
                        child: Text('Select filters to view...'),
                      )
                    : MoviesListWidget(movies: x.movies),
          ),
        ),
      ],
    );
  }
}
