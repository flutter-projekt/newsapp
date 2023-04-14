import 'package:flutter/material.dart';
import '/screens/general_screen.dart';
import '/screens/health_screen.dart';
import '/screens/science_screen.dart';
import '/screens/technology_screen.dart';
import '../widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: const Text(
            "Entdecken",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: TabBar(
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: const Color.fromARGB(255, 226, 223, 223)),
            isScrollable: true,
            tabs: const [
              Tab(text: "Allgemein"),
              Tab(text: "Gesundheit"),
              Tab(text: "Technik"),
              Tab(text: "Wissenschaft"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            GeneralScreen(),
            HealthScreen(),
            TechnologyScreen(),
            ScienceScreen(),
          ],
        ),
        bottomNavigationBar: const BottomNavBar(index: 0),
      ),
    );
  }
}
