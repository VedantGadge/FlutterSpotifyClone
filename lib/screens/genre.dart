import 'package:flutter/material.dart';
import 'package:spotify_clone_app/screens/album.dart';

class GenreScreen extends StatefulWidget {
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
  });

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  late ScrollController scrollController;
  double appBarOpacity = 0;

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
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 30),
                      child: Text(
                        widget.genreName,
                        style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 88, vertical: 10),
                      child: Text(
                        widget.title1,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                    _listView1(),
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

  Container _listView1() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 180,
      child: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
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
            );
          },
          itemCount: widget.listViewImgs1.length,
        ),
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
              Colors.black
                  .withOpacity(appBarOpacity < 0.3 ? 0 : appBarOpacity - 0.3),
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
