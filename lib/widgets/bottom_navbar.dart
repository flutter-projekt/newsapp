import 'package:flutter/material.dart';
import '../screens/news_screen.dart';
import '../screens/fakenews_screen.dart';
import '../screens/favorites_screen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              icon: const Icon(Icons.newspaper_rounded),
            ),
            label: "News"),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, FakenewsScreen.routeName);
              },
              icon: const Icon(Icons.cancel),
            ),
            label: "Report Fake News"),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, FavoritesScreen.routeName);
              },
              icon: const Icon(Icons.favorite),
            ),
            label: "Favorites"),
      ],
    );
  }
}
