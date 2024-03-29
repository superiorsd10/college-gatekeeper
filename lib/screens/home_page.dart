import 'package:college_gatekeeper/constants.dart';
import 'package:flutter/material.dart';
import 'capture_image.dart';
import 'student_list.dart';
import 'defaulter_screen.dart';

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
    DateList(),
    DefaulterScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //! double screenHeight = MediaQuery.of(context).size.height;
    //! double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkBlue,
        title: const Text(
          "College GateKeeper",
          style: TextStyle(
            color: kWhite,
            fontSize: 25,
            fontWeight: FontWeight.w600,
            fontFamily: 'Source Sans Pro',
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              color: kWhite,
            ),
            onSelected: (String result) {
              switch (result) {
                case 'Profile':
                  Navigator.pushReplacementNamed(context, profile);
                  // print('filter 1 clicked');
                  break;
                case 'About Team':
                  Navigator.pushReplacementNamed(context, aboutTeam);
                  // print('filter 2 clicked');
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
                    color: kDarkBlue,
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
                    color: kDarkBlue,
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
        backgroundColor: kDarkBlue,
        unselectedItemColor: const Color.fromRGBO(255, 255, 255, 0.8),
        selectedItemColor: kWhite,
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
