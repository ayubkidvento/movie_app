import 'package:flutter/material.dart';

import '../../models/movie_model.dart';
import 'movie_card_widget.dart';

class HorizontalMoviesListWidget extends StatelessWidget {
  final String title;
  final List<MovieModel> movies;
  const HorizontalMoviesListWidget({
    super.key,
    required this.title,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              height: 1,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 236,
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, i) => SizedBox(
              width: 160,
              child: MovieCardWidget(
                movie: movies[i],
              ),
            ),
            separatorBuilder: (_, i) => const SizedBox(width: 12),
            itemCount: movies.length,
          ),
        ),
      ],
    );
  }
}
