import 'package:flutter/foundation.dart';

class PlaybackState extends ValueNotifier<bool> {
  PlaybackState() : super(false); // false indicates paused

  void setPlaying(bool isPlaying) {
    value = isPlaying;
  }
}

// Create a global instance of PlaybackState
final PlaybackState globalPlaybackState = PlaybackState();
