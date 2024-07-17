import 'package:flutter/material.dart';

class Genres {
  String genre;
  String imageURL;
  Color bgcolor;
  String title1;
  String title2;
  List<String> listViewImgs1;
  List<String> listViewImgs2;
  Color gradColor;

  Genres({
    required this.genre,
    required this.imageURL,
    required this.bgcolor,
    required this.title1,
    required this.title2,
    required this.listViewImgs1,
    required this.listViewImgs2,
    required this.gradColor,
  });
}
