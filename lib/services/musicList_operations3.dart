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
          'This is Atif Aslam',
          'https://thisis-images.spotifycdn.com/37i9dQZF1DZ06evO1n6IJz-default.jpg',
          'This is Atif Aslam. The essential tracks, all in one playlist.',
          'This is Atif Aslam. The essential tracks, all in one playlist.',
          '2024',
          false),
      MusicList(
          'Bruno Mars',
          'https://thisis-images.spotifycdn.com/37i9dQZF1DZ06evO03DwPK-default.jpg',
          'This is Bruno Mars. The essential tracks, all in one playlist',
          'This is Bruno Mars. The essential tracks, all in one...',
          '2024',
          false),
      MusicList(
          'Juice WRLD',
          'https://thisis-images.spotifycdn.com/37i9dQZF1DZ06evO2O09Hg-default.jpg',
          'This is Juice WRLD. The essential tracks, all in one playlist.',
          'This is Juice WRLD. The essential tracks, all in one...',
          '2024',
          false),
    ];
  }
}
