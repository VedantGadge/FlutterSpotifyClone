import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotify/spotify.dart';
import 'package:spotify_clone_app/constants/Colors.dart';
import 'package:spotify_clone_app/constants/clientId.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:audioplayers/audioplayers.dart';

class Musicplayer extends StatefulWidget {
  final Color songBgColor;
  final String srcName;
  final String imgUrl;
  final String songTitle;
  final String songArtists;
  final String songTrackId;

  const Musicplayer({
    super.key,
    required this.songBgColor,
    required this.srcName,
    required this.imgUrl,
    required this.songTitle,
    required this.songArtists,
    required this.songTrackId,
  });

  @override
  State<Musicplayer> createState() => _MusicplayerState();
}

class _MusicplayerState extends State<Musicplayer> {
  final player = AudioPlayer();
  Duration? duration;

  @override
  void initState() {
    final credentials = SpotifyApiCredentials(
        CustomStrings.clientId, CustomStrings.clientSecret);
    final spotify = SpotifyApi(credentials);
    spotify.tracks.get(widget.songTrackId).then((track) async {
      String? tempSongName = track.name;
      final yt = YoutubeExplode();
      final video = (await yt.search.search("$tempSongName")).elementAt(1);
      final videoId = video.id.value;
      duration = video.duration;
      setState(() {});
      var manifest = await yt.videos.streamsClient.getManifest(videoId);
      var audioUrl = manifest.audioOnly.first.url;
      player.play(UrlSource(audioUrl.toString()));
    });
    super.initState();
  }

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
                            player.dispose();
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: StreamBuilder(
                      stream: player.onPositionChanged,
                      builder: (context, data) {
                        return ProgressBar(
                          progress: data.data ?? const Duration(seconds: 0),
                          buffered: const Duration(milliseconds: 2000),
                          total: duration ?? const Duration(minutes: 4),
                          bufferedBarColor: Colors.transparent,
                          baseBarColor: Colors.white10,
                          thumbColor: Colors.white,
                          thumbGlowColor: Colors.transparent,
                          progressBarColor: Colors.white,
                          thumbRadius: 5,
                          timeLabelPadding: 5,
                          timeLabelTextStyle: const TextStyle(
                              color: Colors.white54,
                              fontSize: 13,
                              fontFamily: "Circular",
                              fontWeight: FontWeight.w400),
                          onSeek: (duration) {
                            player.seek(duration);
                          },
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.shuffle_rounded),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_previous_rounded, size: 40),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          player.state == PlayerState.playing
                              ? Icons.pause_circle_filled_sharp
                              : Icons.play_circle_fill_rounded,
                          size: 60,
                        ),
                        color: Colors.white,
                        onPressed: () async {
                          if (player.state == PlayerState.playing) {
                            await player.pause();
                          } else {
                            await player.resume();
                          }
                          setState(() {});
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.skip_next_rounded,
                          size: 40,
                        ),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.repeat_rounded,
                        ),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
