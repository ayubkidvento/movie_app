import 'package:flutter/material.dart';

import '../../config/api_constant.dart';
import '../../models/movie_model.dart';
import '../custom_image_provider_widget.dart';

class MovieCardWidget extends StatelessWidget {
  final MovieModel movie;
  const MovieCardWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    // ratio 160 / 236
    return Container(
      height: 236,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Positioned.fill(
            child: CustomImageProviderWidget(
              image: '$imgURL${movie.posterPath}',
            ),
          ),
        ],
      ),
    );
  }
}
