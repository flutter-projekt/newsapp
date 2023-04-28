import 'package:flutter/material.dart';
import 'screens/news_screen.dart';
import 'screens/fakenews_screen.dart';
import 'screens/favorites_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: "/",
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        FakenewsScreen.routeName: (context) => FakenewsScreen(),
        FavoritesScreen.routeName: (context) => const FavoritesScreen(),
      },
    );
  }
}
