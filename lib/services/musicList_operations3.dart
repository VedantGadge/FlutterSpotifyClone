import 'package:spotify_clone_app/models/musicList.dart';

class MusiclistOperations3 {
  MusiclistOperations3._() {}
  static List<MusicList> getMusic3() {
    return <MusicList>[
      MusicList(
          'All Out 00\'s Hindi',
          'https://i.scdn.co/image/ab67706f000000028caea064dec323af4cb39816',
          'Bollywood songs that ruled hearts in Y2K decade.',
          'Bollywood songs that ruled hearts in Y2K decade.',
          '2024',
          false),
      MusicList(
          'Bollywood Dance Music',
          'https://i.scdn.co/image/ab67706f00000002e9124f623f4bf5f90b393aa3',
          'Party-ready, the biggest Bollywood dance tracks.',
          'Party-ready, the biggest Bollywood dance tracks.',
          '2024',
          false),
      MusicList(
          'This is Atif Aslam',
          'https://thisis-images.spotifycdn.com/37i9dQZF1DZ06evO1n6IJz-default.jpg',
          'This is Atif Aslam. The essential tracks, all in one playlist.',
          'This is Atif Aslam. The essential tracks, all in one playlist.',
          '2024',
          false),
      MusicList(
          'This is Maroon 5',
          'https://thisis-images.spotifycdn.com/37i9dQZF1DZ06evNZY5NHq-default.jpg',
          'This is Maroon 5. The essential tracks, all in one playlist',
          'This is Maroon 5. The essential tracks, all in one playlist',
          '2024',
          false),
    ];
  }
}
