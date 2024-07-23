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
    // Filter out the genre at genreIndex, the genre we currently are at is removed from the browse more genres
    List<Genres> filteredGenresList = List.from(genresList)
      ..removeAt(widget.genreIndex);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              color: const Color(0xff121212),
              child: CustomScrollView(
                scrollBehavior: NoGlowScrollBehavior(),
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(child: _genreName()),
                  const SliverToBoxAdapter(child: SizedBox(height: 10)),
                  SliverToBoxAdapter(child: _title1()),
                  SliverToBoxAdapter(child: _listView1()),
                  const SliverToBoxAdapter(child: SizedBox(height: 10)),
                  SliverToBoxAdapter(child: _title2()),
                  SliverToBoxAdapter(child: _listView2()),
                  const SliverToBoxAdapter(child: SizedBox(height: 30)),
                  const SliverToBoxAdapter(
                      child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 140.0, vertical: 15),
                    child: Text(
                      'Browse All',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )),
                  _gridView(filteredGenresList),
                  if (!showAllGridItems)
                    SliverToBoxAdapter(
                      child: PressableItem(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              showAllGridItems = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(30), // Curved side edges
                                right: Radius.circular(30),
                              ),
                              border: Border.all(
                                color: Colors.white30, // Border color
                                width: 1, // Border width
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0, right: 20, top: 1),
                              child: Text(
                                'Browse more genres',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  const SliverToBoxAdapter(child: SizedBox(height: 300)),
                ],
              ),
            ),
            _appBar(context),
          ],
        ),
      ),
    );
  }

  Container _genreName() {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          widget.gradColor,
          const Color(0xff121212),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Text(
        widget.genreName,
        style: const TextStyle(
            fontSize: 35, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }

  Center _title1() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          widget.title1,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }

  Center _title2() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          widget.title2,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }

  Container _listView1() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
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
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    widget.listViewImgs1[index][2],
                    style: const TextStyle(
                        fontSize: 13,
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
      padding: const EdgeInsets.symmetric(horizontal: 5),
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

  SliverGrid _gridView(List<Genres> filteredGenresList) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 2, // Aspect ratio of each grid item
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final genreInfo = filteredGenresList[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Container(
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
            ),
          );
        },
        childCount: showAllGridItems
            ? filteredGenresList.length
            : (filteredGenresList.length > 8 ? 8 : filteredGenresList.length),
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
              widget.gradColor.withOpacity(appBarOpacity),
              Color.fromARGB(0, 18, 18, 18).withOpacity(
                appBarOpacity < 0.3
                    ? 0
                    : appBarOpacity == 1
                        ? appBarOpacity
                        : appBarOpacity - 0.1,
              ),
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
