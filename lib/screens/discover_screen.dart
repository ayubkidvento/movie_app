import 'package:flutter/material.dart';
import 'package:movie_app/widgets/custom_tabbar_widget.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';
import '../widgets/movie/movies_list_widget.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const CustomTabbarWidget(
            isScrollable: false,
            tabs: ['Movies', 'TV'],
          ),
          Expanded(
            child: Consumer<MoviesProvider>(
              builder: (context, value, _) {
                return TabBarView(
                  children: [
                    MoviesListWidget(movies: value.discoverMovies),
                    MoviesListWidget(movies: value.discoverTvs),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
