import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotify/spotify.dart';
import 'package:spotify_clone_app/constants/Colors.dart';
import 'package:spotify_clone_app/constants/clientId.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:just_audio/just_audio.dart';

class Musicplayer extends StatefulWidget {
  final Color songBgColor;
  final String srcName;
  final String imgUrl;
  final String songTitle;
  final String songArtists;
  final String songTrackId;

  const Musicplayer({
    Key? key,
    required this.songBgColor,
    required this.srcName,
    required this.imgUrl,
    required this.songTitle,
    required this.songArtists,
    required this.songTrackId,
  }) : super(key: key);

  @override
  State<Musicplayer> createState() => _MusicplayerState();
}

class _MusicplayerState extends State<Musicplayer> {
  final player = AudioPlayer();
  Duration? duration;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      final credentials = SpotifyApiCredentials(
          CustomStrings.clientId, CustomStrings.clientSecret);
      final spotify = SpotifyApi(credentials);

      final track = await spotify.tracks.get(widget.songTrackId);
      String? tempSongName = track.name; // tempSongName is nullable

      if (tempSongName == null) {
        throw Exception('Track name is null');
      }

      final yt = YoutubeExplode();
      final searchResults =
          await yt.search.search("$tempSongName ${widget.songArtists}");
      final video = searchResults.elementAt(1);

      var manifest = await yt.videos.streamsClient.getManifest(video.id.value);
      var audioUrl = manifest.audioOnly.first.url;

      await player.setAudioSource(AudioSource.uri(audioUrl));
      duration = video.duration;

      setState(() {
        player.processingState == ProcessingState.loading ||
                player.processingState == ProcessingState.buffering
            ? isLoading = true
            : isLoading = false;
      });
    } catch (e) {
      // Handle exceptions appropriately
      print("Error initializing player: $e");
      setState(() {
        isLoading = false; // Set to false if there's an error
      });
    }
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading == true) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(
            color: Color(0xff1DB954),
            strokeWidth: 4,
          ),
        ),
      );
    }

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
                  _buildTopBar(context),
                  const SizedBox(height: 60),
                  _buildAlbumArt(),
                  const SizedBox(height: 60),
                  _buildSongInfo(),
                  const SizedBox(height: 10),
                  _buildProgressBar(),
                  _buildControls()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
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
                style:
                    TextStyle(color: customColors.primaryColor, fontSize: 15),
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
    );
  }

  Widget _buildAlbumArt() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: CachedNetworkImage(
        imageUrl: widget.imgUrl,
        height: 365,
        width: 365,
      ),
    );
  }

  Widget _buildSongInfo() {
    return Row(
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
    );
  }

  Widget _buildProgressBar() {
    return Stack(
      children: [
        StreamBuilder<PlayerState>(
          stream: player.playerStateStream,
          builder: (context, snapshot) {
            final processingState = snapshot.data?.processingState;
            if (processingState == ProcessingState.loading ||
                processingState == ProcessingState.buffering) {
              return Container(
                height: 4,
                child: const LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white60),
                ),
              );
            }
            return Container(); // Empty container when not loading or buffering
          },
        ),
        StreamBuilder<Duration>(
          builder: (context, snapshot) {
            final position = snapshot.data ?? Duration.zero;
            return ProgressBar(
              progress: position,
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
                fontWeight: FontWeight.w400,
              ),
              onSeek: (newDuration) {
                player.seek(newDuration);
              },
            );
          },
          stream: player.positionStream,
        ),
      ],
    );
  }

  Widget _buildControls() {
    return StreamBuilder<PlayerState>(
      stream: player.playerStateStream,
      builder: (context, snapshot) {
        final playing = snapshot.data?.playing;

        return Row(
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
                playing == true
                    ? Icons.pause_circle_filled_sharp
                    : Icons.play_circle_fill_rounded,
                size: 75,
              ),
              color: Colors.white,
              onPressed: () async {
                if (playing == true) {
                  await player.pause();
                } else {
                  await player.play();
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
        );
      },
    );
  }
}
