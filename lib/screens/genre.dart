import 'package:flutter/material.dart';

class GenreScreen extends StatefulWidget {
  final String genreName;
  final String title1;
  final String title2;
  final List<String> listViewImgs1;
  final List<String> listViewImgs2;
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
                      widget.gradColor,
                      widget.gradColor,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                      Colors.black,
                      Colors.black,
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
                child: const Column(
                  children: [],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
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
                backgroundColor: widget.gradColor.withOpacity(appBarOpacity),
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
          ],
        ),
      ),
    );
  }
}
