import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';

import '../models/FavList.dart';
import 'article_details_screen.dart';

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
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: FavList.title.length,
        prototypeItem: ListTile(
          title: Text(FavList.title.first),
        ),
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleDetailsScreen(
                    title: FavList.title[index],
                    author: FavList.author[index],
                    publishedAt: FavList.publishedAt[index],
                    description: FavList.description[index],
                    content: FavList.content[index],
                    urlToImage: FavList.urlToImage[index],
                    url: FavList.url[index],
                  ),
                ),
              );
            },
            title: Text(FavList.title[index]),
          );
        },
      ),
      bottomNavigationBar: const BottomNavBar(index: 2),
    );
  }
}
