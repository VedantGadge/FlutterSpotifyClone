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
        //We have used Stack here so that we can have the bottom navigation bar overlap the current display screen.
        children: [
          Positioned.fill(
            child: Container(
              child: tabs[_selectedIndex],
            ),
          ),
          Positioned(
            //used Positioned so that we can place the bottom navigation bar at the bottom, since it wont be by default be at the bottom as we have wrapped it inside a container,so that we can use it inside a stack.
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [Color.fromARGB(164, 0, 0, 0), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )),
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
          ),
        ],
      ),
    );
  }
}
