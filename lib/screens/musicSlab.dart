import 'package:flutter/material.dart';

class MusicSlab extends StatelessWidget {
  final String songTitle;
  final String artistName;
  final String albumArtUrl;
  final bool isPlaying;
  final VoidCallback onPlayPausePressed;
  final VoidCallback onTap;

  MusicSlab({
    required this.songTitle,
    required this.artistName,
    required this.albumArtUrl,
    required this.isPlaying,
    required this.onPlayPausePressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 10),
        color: Colors.black54,
        child: Row(
          children: [
            // Album Art
            Image.network(
              albumArtUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            // Song and Artist Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    songTitle,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    artistName,
                    style: TextStyle(color: Colors.white70),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Play/Pause Button
            IconButton(
              icon: Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.white,
              ),
              onPressed: onPlayPausePressed,
            ),
          ],
        ),
      ),
    );
  }
}
