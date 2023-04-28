import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  static const routeName = "/favorites";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // TODO: navigate to settings screen
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              'https://static.boredpanda.com/blog/wp-content/uploads/2015/09/cute-hamsters-1__880.jpg',
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Hamilton',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'hamsterhamilton@gmail.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 20),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favoriten'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: navigate to favorites screen
            },
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Verlauf'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: navigate to history screen
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Benachrichtigungen'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: navigate to notifications screen
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Teilen'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: implement share functionality
            },
          ),
          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text('Bewerte unsere App'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: navigate to app rating screen
            },
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(index: 2),
    );
  }
}
