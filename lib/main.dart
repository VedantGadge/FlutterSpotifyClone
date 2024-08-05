import 'package:flutter/material.dart';
import 'package:spotify_clone_app/screens/app.dart';
import 'package:spotify_clone_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
      theme: ThemeData(
        fontFamily: 'Circular',
        splashColor: Colors.transparent, // Removes splash color on tap
        highlightColor: Colors.transparent, // Removes highlight on tap
        splashFactory: NoSplash.splashFactory, // Removes splash animation
      ),
    );
  }
}
