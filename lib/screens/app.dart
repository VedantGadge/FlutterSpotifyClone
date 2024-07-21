import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone_app/constants/pressEffect.dart';
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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.2),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.8),
                  ],
                  stops: const [
                    0.0,
                    0.2,
                    0.4,
                    0.6,
                    0.7,
                    0.8,
                    0.85,
                    0.9,
                    1.0,
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
                  icon: PressableItem(
                    child: SvgPicture.asset(
                      _selectedIndex == 0
                          ? 'assets/icons/home_alt.svg'
                          : 'assets/icons/home.svg',
                      height: 25,
                      color: Colors.white,
                    ),
                    onTap: () => _onItemTapped(0),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: PressableItem(
                    child: SvgPicture.asset(
                      _selectedIndex == 1
                          ? 'assets/icons/search_alt.svg'
                          : 'assets/icons/search.svg',
                      height: 25,
                      color: Colors.white,
                    ),
                    onTap: () => _onItemTapped(1),
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: PressableItem(
                    child: SvgPicture.asset(
                      'assets/icons/library.svg',
                      height: 25,
                      color: Colors.white,
                    ),
                    onTap: () => _onItemTapped(2),
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
