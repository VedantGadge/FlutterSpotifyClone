import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone_app/screens/home.dart';
import 'package:spotify_clone_app/screens/library.dart';
import 'package:spotify_clone_app/screens/search.dart';

class MainApp extends StatefulWidget {
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> tabs = [
    const HomePage(),
    SearchPage(),
    const LibraryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: tabs[_selectedIndex],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 80,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Color.fromARGB(80, 0, 0, 0),
                    Color.fromARGB(120, 0, 0, 0),
                    Color.fromARGB(140, 0, 0, 0),
                    Color.fromARGB(160, 0, 0, 0),
                    Color.fromARGB(180, 0, 0, 0),
                    Color.fromARGB(220, 0, 0, 0),
                  ],
                  stops: [
                    0.1,
                    0.2,
                    0.5,
                    0.6,
                    0.68,
                    0.72,
                    0.78,
                    0.82,
                    0.86,
                    1,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    _selectedIndex == 0
                        ? 'assets/icons/home_alt.svg'
                        : 'assets/icons/home.svg',
                    height: 25,
                    color: Colors.white,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    _selectedIndex == 1
                        ? 'assets/icons/search_alt.svg'
                        : 'assets/icons/search.svg',
                    height: 25,
                    color: Colors.white,
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/library.svg',
                    height: 25,
                    color: Colors.white,
                  ),
                  label: 'Your Library',
                ),
              ],
              backgroundColor: Colors.transparent,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white54,
              selectedFontSize: 12,
              unselectedFontSize: 12,
              onTap: _onItemTapped,
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}
