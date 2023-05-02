import 'package:flutter/material.dart';
import 'capture_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ImageCapture(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 95, 153, 1),
        title: const Text(
          "College Gatekeeper",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
            fontFamily: 'Source Sans Pro',
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: (String result) {
              switch (result) {
                case 'Profile':
                  print('filter 1 clicked');
                  break;
                case 'About Team':
                  print('filter 2 clicked');
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Profile',
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 95, 153, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'About Team',
                child: Text(
                  'About Team',
                  style: TextStyle(
                    color: Color.fromRGBO(0, 95, 153, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Source Sans Pro',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(0, 95, 153, 1),
        unselectedItemColor: const Color.fromRGBO(255, 255, 255, 0.8),
        selectedItemColor: const Color.fromRGBO(255, 255, 255, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt_outlined,
            ),
            label: 'Capture',
            // backgroundColor: Color.fromRGBO(0, 95, 153, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'List',
            // backgroundColor: Color.fromRGBO(0, 95, 153, 1),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error_outlined),
            label: 'Defaulters',
            // backgroundColor: Color.fromRGBO(0, 95, 153, 1),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
