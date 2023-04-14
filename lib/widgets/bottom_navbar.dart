import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/discover_screen.dart';
import '../screens/profile_screen.dart';

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
              icon: const Icon(Icons.home),
            ),
            label: "Home"),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, DiscoverScreen.routeName);
              },
              icon: const Icon(Icons.search),
            ),
            label: "Suche"),
        BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ProfileScreen.routeName);
              },
              icon: const Icon(Icons.person),
            ),
            label: "Profil"),
      ],
    );
  }
}
