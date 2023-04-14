import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: const BottomNavBar(index: 2),
      body: Container(),
    );
  }
}
