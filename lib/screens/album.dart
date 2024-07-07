import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_clone_app/screens/home.dart';

class AlbumView extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String desc;
  final String year;
  final List<Song> songInfo;
  final bool showTitle;

  AlbumView({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.songInfo,
    required this.desc,
    required this.year,
    required this.showTitle,
  });

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: initialSize + imageTopMargin + 30),
                        albumInfo(),
                        playlistFunctions(),
                        const SizedBox(height: 30),
                        ...generateSongWidgets(context),
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
                          blurRadius: 20,
                          spreadRadius: 7.5,
                          color: Colors.black.withOpacity(0.3),
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
                  backgroundColor: _backgroundColor?.withOpacity(appBarOpacity),
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
                  actions: [
                    Opacity(
                      opacity: appBarOpacity,
                      child: Container(
                        color: _backgroundColor ?? Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> generateSongWidgets(BuildContext context) {
    List<Widget> songWidgets = [];
    for (int i = 0; i < widget.songInfo.length; i++) {
      songWidgets.add(songWidget(context, i));
    }
    return songWidgets;
  }

  Widget songWidget(BuildContext context, int index) {
    return InkWell(
      //We are using InkWell instead of GestureDetector because, if we use GestureDetector, only the Title Text is tappable and not the whole row container, this we use InkWell so that the whole area is tappable.
      onTap: () {
        print('${widget.songInfo[index].songName} button pressed');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.songInfo[index].songName,
                        style: GoogleFonts.roboto(
                          color: const Color.fromARGB(248, 255, 255, 255),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      widget.songInfo[index].isExplicit
                          ? Row(
                              children: [
                                const Icon(
                                  Icons.explicit_rounded,
                                  color: Colors.white54,
                                  size: 17,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  widget.songInfo[index].songArtists,
                                  style: GoogleFonts.roboto(
                                    color: const Color.fromARGB(
                                        161, 255, 255, 255),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          : Text(
                              widget.songInfo[index].songArtists,
                              style: GoogleFonts.roboto(
                                color: const Color.fromARGB(161, 255, 255, 255),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ],
                  ),
                  GestureDetector(
                    child: const Icon(Icons.more_vert_rounded,
                        color: Colors.white),
                    onTap: () {
                      print('More button pressed');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column albumInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 5),
          child: widget.showTitle
              ? Text(
                  widget.title,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    widget.desc,
                    style: GoogleFonts.roboto(
                      color: Colors.white54,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
        ),
        widget.showTitle
            ? Padding(
                padding: const EdgeInsets.only(left: 7, top: 5),
                child: Text(
                  widget.songInfo[0].songArtists,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              )
            : const SizedBox(),
        widget.showTitle
            ? Padding(
                padding: const EdgeInsets.only(left: 7, top: 5),
                child: Text(
                  widget.showTitle ? 'Album • ${widget.year}' : '',
                  style: const TextStyle(
                      color: Colors.white60,
                      fontSize: 12,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w700),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  Row playlistFunctions() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/icons/logo.png',
            height: 20,
            width: 20,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 1),
          child: Text(
            'Spotify',
            style: TextStyle(fontSize: 14, color: Colors.white60),
          ),
        ),
        GestureDetector(
          child: const Padding(
            padding: EdgeInsets.only(left: 16, top: 3),
            child: Icon(
              Icons.playlist_add_rounded,
              color: Colors.white70,
              size: 25,
            ),
          ),
          onTap: () {
            print('Add to playlist button tapped');
          },
        ),
        GestureDetector(
          child: const Padding(
            padding: EdgeInsets.only(left: 16, top: 3),
            child: Icon(
              Icons.download_for_offline_outlined,
              color: Colors.white70,
              size: 25,
            ),
          ),
          onTap: () {
            print('Download button tapped');
          },
        ),
        GestureDetector(
          child: const Padding(
            padding: EdgeInsets.only(left: 16, top: 3),
            child: Icon(
              Icons.more_vert_sharp,
              color: Colors.white70,
              size: 25,
            ),
          ),
          onTap: () {
            print('More button tapped');
          },
        ),
        GestureDetector(
          child: const Padding(
            padding: EdgeInsets.only(left: 80, top: 3, right: 13),
            child: Icon(
              Icons.shuffle_rounded,
              color: Colors.white70,
              size: 25,
            ),
          ),
          onTap: () {
            print('Shuffle button tapped');
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xff14D860)),
            child: const Icon(
              Icons.play_arrow_rounded,
              size: 37,
            ),
          ),
        ),
      ],
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
