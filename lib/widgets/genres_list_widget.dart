import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/genre_model.dart';
import '../providers/genre_provider.dart';

class GenresListWidget extends StatelessWidget {
  final bool isTv;
  final GenreModel? selected;
  final List<GenreModel> genres;
  const GenresListWidget({
    super.key,
    this.isTv = false,
    this.selected,
    required this.genres,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: genres
          .map((e) => ChoiceChip(
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                label: Text(e.name),
                labelStyle: const TextStyle(
                  fontSize: 12,
                  height: 1,
                ),
                selected: selected?.id == e.id,
                onSelected: (_) =>
                    context.read<GenreProvider>().updateGenre(isTv, e),
                elevation: 1,
                side: BorderSide(
                  width: .5,
                  color: Colors.grey.shade300,
                ),
              ))
          .toList(),
    );
  }
}
