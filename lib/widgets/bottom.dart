import 'package:flutter/material.dart';
import '../screens/screens.dart';

class Bottom extends StatelessWidget {
  const Bottom({
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
              icon: const Icon(Icons.home)),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, DiscoverScreen.routeName);
              },
              icon: const Icon(Icons.search)),
          label: "Suche", //TODO: create search function
        ),
        BottomNavigationBarItem(
          icon: IconButton(
              onPressed: () {
                print("No profile screen yet");
              },
              icon: const Icon(Icons.person)),
          label: "Profil", //TODO: create profile section
        )
      ],
    );
  }
}
