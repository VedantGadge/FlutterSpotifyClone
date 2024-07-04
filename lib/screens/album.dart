import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class AlbumView extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String song1Url;
  final String song2Url;
  final String song3Url;
  final String albumDesc;
  final String song1imageUrl;
  final String song2imageUrl;
  final String song3imageUrl;
  final String song1name;
  final String song1singers;
  final String song2name;
  final String song2singers;
  final String song3name;
  final String song3singers;

  const AlbumView({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.song1Url,
    required this.song2Url,
    required this.song3Url,
    required this.albumDesc,
    required this.song1imageUrl,
    required this.song2imageUrl,
    required this.song3imageUrl,
    required this.song1name,
    required this.song1singers,
    required this.song2name,
    required this.song2singers,
    required this.song3name,
    required this.song3singers,
  }) : super(key: key);

  @override
  _AlbumViewState createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  late ScrollController scrollController;
  double imageSize = 0;
  double initialSize = 240;
  double imageTopMargin = 80; // Initial top margin for the image
  double minImageSize = 100; // Minimum size the image can shrink to
  double imageOpacity = 1;
  double appBarOpacity = 0;
  late PaletteGenerator _paletteGenerator;
  Color? _backgroundColor;

  @override
  void initState() {
    imageSize = initialSize;
    scrollController = ScrollController()
      ..addListener(() {
        double offset = scrollController.offset;
        if (offset < imageTopMargin) {
          // Image moves up with the rest of the screen
          imageOpacity = 1;
        } else {
          // Image starts shrinking and fading when it reaches the top
          double shrinkOffset = offset - imageTopMargin;
          imageSize =
              (initialSize - shrinkOffset).clamp(minImageSize, initialSize);
          imageOpacity =
              ((initialSize - shrinkOffset) / initialSize).clamp(0.0, 1.0);
        }

        // Adjust app bar opacity based on when the image reaches its minimum size
        if (imageSize == minImageSize) {
          double minSizeOffset =
              offset - (initialSize - minImageSize + imageTopMargin);
          appBarOpacity =
              minSizeOffset / 50.0; // Adjust 50.0 to control the fade-in speed
          appBarOpacity = appBarOpacity.clamp(0.0, 1.0);
        } else {
          appBarOpacity = 0;
        }

        setState(() {});
      });
    super.initState();
    _loadPalette();
  }

  Future<void> _loadPalette() async {
    final imageProvider = NetworkImage(widget.imageUrl);
    _paletteGenerator = await PaletteGenerator.fromImageProvider(imageProvider);
    setState(() {
      _backgroundColor = _paletteGenerator.dominantColor?.color;
    });
  }

  @override
  void dispose() {
    scrollController.dispose(); // Dispose the scroll controller properly
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double topPosition = (scrollController.hasClients &&
            scrollController.offset < imageTopMargin)
        ? imageTopMargin - scrollController.offset
        : 0;

    return SafeArea(
      child: ScrollConfiguration(
        behavior: NoGlowScrollBehavior(), // Disable overscroll glow effect
        child: Scaffold(
          body: Stack(
            children: [
              SafeArea(
                child: SingleChildScrollView(
                  controller: scrollController,
                  physics:
                      const ClampingScrollPhysics(), // Disable bouncing scroll effect
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          _backgroundColor ?? Colors.black,
                          Colors.black,
                        ],
                        stops: const [0.25, 1],
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: initialSize + imageTopMargin + 50),
                        Text(
                          widget.song1singers,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        // Rest of your content here
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: topPosition + 20,
                left: MediaQuery.of(context).size.width / 2 - imageSize / 2,
                child: Opacity(
                  opacity: imageOpacity,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 2,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ],
                    ),
                    child: Image.network(
                      widget.imageUrl,
                      height: imageSize,
                      width: imageSize,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: appBarOpacity,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        _backgroundColor ?? Colors.black,
                        Color.fromARGB(138, 0, 0, 0)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                    child: AppBar(
                      scrolledUnderElevation: 0,
                      title: Opacity(
                        opacity: appBarOpacity,
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_sharp),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
