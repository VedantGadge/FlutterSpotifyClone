import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone_app/constants/Colors.dart';

class Musicplayer extends StatefulWidget {
  final Color songBgColor;
  final String srcName;
  final String imgUrl;
  final String songTitle;
  final String songArtists;

  const Musicplayer(
      {super.key,
      required this.songBgColor,
      required this.srcName,
      required this.imgUrl,
      required this.songTitle,
      required this.songArtists});

  @override
  State<Musicplayer> createState() => _MusicplayerState();
}

class _MusicplayerState extends State<Musicplayer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 1000,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  widget.songBgColor,
                  widget.songBgColor,
                  const Color(0xff121212),
                  const Color(0xff121212),
                  const Color(0xff121212),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_downward_rounded,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Text(
                              'Playing Now',
                              style: TextStyle(
                                  color: customColors.primaryColor,
                                  fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Text(
                              'from "${widget.srcName}" playlist',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 15),
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Icon(
                          Icons.more_vert_sharp,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: CachedNetworkImage(
                      imageUrl: widget.imgUrl,
                      height: 365,
                      width: 365,
                    ),
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.songTitle,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 25,
                                color: Colors.white),
                          ),
                          Text(
                            widget.songArtists,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 17,
                              color: Color(0xffa7a7a7),
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.favorite,
                        color: customColors.primaryColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
