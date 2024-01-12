import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/value_provider.dart';
import 'discover_screen.dart';
import 'genre_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ValueProvider>(
      builder: (context, value, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('MOVIE APP'),
            
          ),
          body: _widgets[value.index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: value.index,
            onTap: (x) => value.changeInndex(x),
            type: BottomNavigationBarType.fixed,
            items: _title.map((e) {
              var i = _title.indexOf(e);
              return BottomNavigationBarItem(
                label: e,
                icon: Icon(_icons[i]),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

const List<Widget> _widgets = [
  DiscoverScreen(),
  HomeScreen(),
  GenreScreen(),
  ProfileScreen(),
];

List<String> _title = ['Dicover', 'Home', 'Genre', 'Profile'];
List<IconData> _icons = [
  Icons.explore_rounded,
  Icons.home_rounded,
  Icons.category_rounded,
  Icons.person_rounded,
];
