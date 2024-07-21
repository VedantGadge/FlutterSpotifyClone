import 'package:flutter/material.dart';
import 'package:spotify_clone_app/constants/pressEffect.dart';
import 'package:spotify_clone_app/models/genres.dart';
import 'package:spotify_clone_app/screens/album.dart';
import 'package:spotify_clone_app/services/genre_operations.dart';

class GenreScreen extends StatefulWidget {
  final int genreIndex;
  final String genreName;
  final String title1;
  final String title2;
  final List<List<String>> listViewImgs1;
  final List<List<String>> listViewImgs2;
  final Color gradColor;

  GenreScreen({
    super.key,
    required this.title1,
    required this.title2,
    required this.listViewImgs1,
    required this.listViewImgs2,
    required this.gradColor,
    required this.genreName,
    required this.genreIndex,
  });

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  late List<Genres> genresList;
  late ScrollController scrollController;
  double appBarOpacity = 0;
  bool showAllGridItems = false; // State to manage grid items visibility

  @override
  void initState() {
    scrollController = ScrollController()
      ..addListener(() {
        double offset = scrollController.offset;
        setState(() {
          if (offset < 100) {
            appBarOpacity = offset / 100.0;
          } else {
            appBarOpacity = 1.0;
          }
        });
      });
    super.initState();
    genresList = GenreOperations.getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1000,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      widget.gradColor,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                  ),
                ),
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _genreName(),
                    const SizedBox(height: 10),
                    _title1(),
                    _listView1(),
                    const SizedBox(height: 10),
                    _title2(),
                    _listView2(),
                    const SizedBox(height: 10),
                    _gridView(),
                    if (!showAllGridItems)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            showAllGridItems = true;
                          });
                        },
                        child: Text(
                          'Browse All',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            _appBar(context),
          ],
        ),
      ),
    );
  }

  Padding _genreName() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 30),
      child: Text(
        widget.genreName,
        style: const TextStyle(
            fontSize: 35, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }

  Padding _title1() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 88, vertical: 10),
      child: Text(
        widget.title1,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }

  Padding _title2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 10),
      child: Text(
        widget.title2,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }

  Container _listView1() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 180,
      child: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return PressableItem(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: 130,
                      child: Image.asset(
                        widget.listViewImgs1[index][0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      widget.listViewImgs1[index][1],
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    widget.listViewImgs1[index][2],
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white60,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            );
          },
          itemCount: widget.listViewImgs1.length,
        ),
      ),
    );
  }

  Container _listView2() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 180,
      child: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return PressableItem(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: 130,
                      child: Image.asset(
                        widget.listViewImgs2[index][0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(
                      widget.listViewImgs2[index][1],
                      style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    widget.listViewImgs2[index][2],
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white60,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            );
          },
          itemCount: widget.listViewImgs2.length,
        ),
      ),
    );
  }

  Container _gridView() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 300, // Adjust height as needed
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 2, // Aspect ratio of each grid item
        ),
        itemCount: showAllGridItems
            ? genresList.length
            : (genresList.length > 8 ? 8 : genresList.length),
        itemBuilder: (context, index) {
          final genreInfo = genresList[index];
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: genreInfo.bgcolor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 12),
                    child: Text(
                      genreInfo.genre,
                      style: const TextStyle(
                        fontSize: 18.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 133,
                    child: Transform.rotate(
                      angle: 0.48,
                      child: Container(
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 5,
                          )
                        ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            genreInfo.imageURL,
                            scale: 4.2,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }

  Positioned _appBar(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              widget.gradColor,
              Colors.black.withOpacity(appBarOpacity < 0.3
                  ? 0
                  : appBarOpacity == 1
                      ? appBarOpacity
                      : appBarOpacity - 0.2),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: AppBar(
          scrolledUnderElevation: 0,
          title: Opacity(
            opacity: appBarOpacity,
            child: Text(
              widget.genreName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
