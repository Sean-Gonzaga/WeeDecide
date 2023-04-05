import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'weed_page.dart';
import 'about_page.dart';
import 'herbicide_page.dart';
import 'camera_page.dart';

void main() {
  runApp(const WeeDecide());
}

class WeeDecide extends StatefulWidget {
  const WeeDecide({super.key});

  @override
  State<WeeDecide> createState() => _WeeDecideState();
}

class _WeeDecideState extends State<WeeDecide> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeeDecideExtension(),
    );
  }
}

//Extension class for buttons

class WeeDecideExtension extends StatefulWidget {
  const WeeDecideExtension({super.key});

  @override
  State<WeeDecideExtension> createState() => _WeeDecideExtensionState();
}

class _WeeDecideExtensionState extends State<WeeDecideExtension> {
  int _selectedIndex = 0;
  File? galleryFile;
  final picker = ImagePicker();

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

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('WeeDecide'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 60),
                    backgroundColor: Colors
                        .green, // Set the button's background color // Set the text color
                  ),
                  onPressed: () async {
                    await availableCameras().then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CameraPage(cameras: value),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Camera',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 60),
                    backgroundColor: Colors
                        .green, // Set the button's background color // Set the text color
                  ),
                  onPressed: () {
                    _showPicker(context: context);
                  },
                  child: const Text(
                    'Gallery',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
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
      ),
    );
  }
}
