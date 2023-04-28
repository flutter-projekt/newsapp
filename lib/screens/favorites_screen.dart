import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';

import '../models/FavList.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);
  static const routeName = "/favorites";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Favorites',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [],
      ),
      body: Column(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: FavList.favorites.length,
            prototypeItem: ListTile(
              title: Text(FavList.favorites.first),
            ),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(FavList.favorites[index]),
          );
  },
)
        ]
      ),
      bottomNavigationBar: const BottomNavBar(index: 2),
    );
  }
}
