import 'package:spotify_clone_app/models/musicList.dart';

class MusiclistOperations2 {
  MusiclistOperations2._() {}
  static List<MusicList> getMusic2() {
    return <MusicList>[
      MusicList(
          'Marshmello',
          'https://thisis-images.spotifycdn.com/37i9dQZF1DZ06evO3Adu8w-default.jpg',
          'This is Marshmello. The essential tracks, all in one playlist.',
          'This is Marshmello. The \nessential tracks, all in one...','2024'),
      MusicList(
          'One Direction',
          'https://i.scdn.co/image/ab67706f00000002b75cdf3f088c129cc350c0f8',
         ' This is One Direction. The essential tracks, all in one playlist.',
          'This is One Direction. The \nessential tracks, all in one...','2024'),
      MusicList(
          'Bruno Mars',
          'https://thisis-images.spotifycdn.com/37i9dQZF1DZ06evO03DwPK-default.jpg',
          'This is Bruno Mars. The essential tracks, all in one playlist',
          'This is Bruno Mars. The \nessential tracks, all in one...','2024'),
      MusicList(
          'Juice WRLD',
          'https://thisis-images.spotifycdn.com/37i9dQZF1DZ06evO2O09Hg-default.jpg',
          'This is Juice WRLD. The essential tracks, all in one playlist.',
          'This is Juice WRLD. The \nessential tracks, all in one...','2024'),
    ];
  }
}
