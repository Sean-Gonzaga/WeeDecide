import 'package:flutter/material.dart';
import 'package:weedecide/weed_page.dart';
import 'about_page.dart';
import 'main.dart';

class HerbicidePage extends StatefulWidget {
  const HerbicidePage({super.key});

  @override
  State<HerbicidePage> createState() => _HerbicidePageState();
}

class _HerbicidePageState extends State<HerbicidePage> {
  String buttonName = 'Click';
  int _selectedIndex = 2;

  final List<Widget> _pages = const [
    WeeDecideExtension(),
    WeedPage(),
    HerbicidePage(),
    AboutPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Herbicide'),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grass),
            label: 'Weed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication_liquid),
            label: 'Herbicide',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.info),
          //   label: 'About',
          // ),
        ],
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
