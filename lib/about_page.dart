import 'package:flutter/material.dart';
import 'package:weedecide/weed_page.dart';

import 'herbicide_page.dart';
import 'main.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String buttonName = 'Click';
  int _selectedIndex = 3;

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
        title: const Text('About'),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        selectedItemColor: Colors.green,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
