import 'package:flutter/material.dart';

import 'package:weedecide/model/weeds.dart';
import 'package:weedecide/weed_details.dart';

import 'about_page.dart';
import 'herbicide_page.dart';
import 'main.dart';

class WeedPage extends StatefulWidget {
  const WeedPage({super.key});

  @override
  State<WeedPage> createState() => _WeedPageState();
}

class _WeedPageState extends State<WeedPage> {
  String buttonName = 'Click';
  int _selectedIndex = 1;

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
        title: const Text('Weed'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
          itemCount: weedList.length,
          itemBuilder: (context, index) {
            Weed weed = weedList[index];
            return Card(
              child: ListTile(
                title: Text(weed.weedName),
                subtitle: Text(weed.localName),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(weed.image),
                ),
                trailing: const Icon(Icons.arrow_forward_rounded),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeedDetails(
                        weed: weed,
                      ),
                    ),
                  );
                },
              ),
            );
          }),
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
