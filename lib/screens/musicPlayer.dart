import 'package:flutter/material.dart';
import 'package:spotify_clone_app/constants/Colors.dart';

class Musicplayer extends StatefulWidget {
  final Color songBgColor;
  const Musicplayer({super.key, required this.songBgColor});

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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_downward_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(width: 100),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Playing Now',
                            style: TextStyle(
                                color: customColors.primaryColor, fontSize: 15),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(width: 100),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Icon(
                        Icons.more_vert_sharp,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
