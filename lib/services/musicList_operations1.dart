import 'package:spotify_clone_app/models/musicList.dart';

class MusiclistOperations1 {
  MusiclistOperations1._() {}
  static List<MusicList> getMusic1() {
    return <MusicList>[
      MusicList(
          'On Repeat',
          'https://daily-mix.scdn.co/covers/on_repeat/PZN_On_Repeat2_DEFAULT-en.jpg',
          'Songs you love right now'),
      MusicList(
          'Your Discover Weekly',
          'https://newjams-images.scdn.co/image/ab676477000033ad/dt/v3/discover-weekly/39MO4rpxkctRc574LExDwQ==/ZGlkaWRpZGlkaWRpZGlkaQ==',
          'Your weekly mixtape \n of fresh music'),
      MusicList(
          'phonk',
          'https://i.scdn.co/image/ab67706f000000028a9e50e6e634a604fa545f72',
          'the beat of your drift'),
    ];
  }
}
