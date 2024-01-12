import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/genre_provider.dart';
import '../genres_list_widget.dart';

moviesFilterBottombarWidget(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    constraints: const BoxConstraints(
      maxHeight: 300,
    ),
    builder: (context) {
      return Consumer<GenreProvider>(
        builder: (context, value, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Movies Genres'),
                const SizedBox(height: 6),
                GenresListWidget(
                  genres: value.moviesGenres,
                  selected: value.selectedMovieGenre,
                ),
                const SizedBox(height: 12),
                const Text('TV Genres'),
                const SizedBox(height: 6),
                GenresListWidget(
                  isTv: true,
                  genres: value.tvGenres,
                  selected: value.selectedTvGenre,
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
