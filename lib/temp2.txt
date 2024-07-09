import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone_app/models/category.dart';
import 'package:spotify_clone_app/models/musicList.dart';
import 'package:spotify_clone_app/screens/album.dart';
import 'package:spotify_clone_app/services/category_operations.dart';
import 'package:spotify_clone_app/services/musicList_operations1.dart';
import 'package:spotify_clone_app/services/musicList_operations2.dart';
import 'package:spotify_clone_app/services/musicList_operations3.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Song {
  String songUrl;
  String songName;
  String songArtists;
  bool isExplicit;

  Song(this.songUrl, this.songName, this.songArtists, this.isExplicit);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Category> categoryList;
  late List<MusicList> musicList1;
  late List<MusicList> musicList2;
  late List<MusicList> musicList3;

  @override
  void initState() {
    super.initState();
    // Initialize your data fetching or any other initialization here
    categoryList = CategoryOperations.getCategories();
    musicList1 = MusiclistOperations1.getMusic1();
    musicList2 = MusiclistOperations2.getMusic2();
    musicList3 = MusiclistOperations3.getMusic3();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoOverscrollGlowBehavior(),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffb3b3b3), // Light grey color
                  Colors.black, // Black color
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.3],
              ),
            ),
            child: Column(
              children: [
                _appBar(), // Custom app bar widget
                const SizedBox(height: 5),
                createGrid(context), // Grid of categories
                const SizedBox(height: 10),
                createMusicList1(context), // First list of music
                const SizedBox(height: 10),
                createMusicList2(context),
                const SizedBox(height: 10),
                createMusicList3(context), // Second list of music
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom app bar with dynamic greeting based on time of day
  AppBar _appBar() {
    return AppBar(
      title: Container(
        padding: const EdgeInsets.only(top: 8.0, left: 0),
        child: Text(
          (DateTime.now().hour >= 5 && DateTime.now().hour <= 12
              ? 'Good morning'
              : (DateTime.now().hour >= 12 && DateTime.now().hour <= 17
                  ? 'Good afternoon'
                  : (DateTime.now().hour >= 17 && DateTime.now().hour <= 21
                      ? 'Good evening'
                      : 'Good night'))),
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontFamily: 'Circular',
            fontWeight: FontWeight.w800,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Container(
            height: 27,
            width: 27,
            child: SvgPicture.asset('assets/icons/gear.svg'),
          ),
        )
      ],
      backgroundColor: Colors.transparent, // Transparent app bar background
    );
  }

  // Create a category widget with a gesture detector for navigation
  Widget createCategory(BuildContext context, Category category, int index) {
    return GestureDetector(
      onTap: () {
        List<Song> songs;
        switch (index) {
          case 0:
            songs = [
              Song("url1_for_category_0", "Tera Fitoor", 'Arijit Singh', false),
              Song("url1_for_category_0", "Chaleya",
                  'Arijit Singh, Anirudh Ravichander, Shilpa Rao,', false),
              Song("url1_for_category_0", "Kabhi Jo Baadal Barse",
                  'Arijit Singh', false),
              Song("url1_for_category_0", "Tere Hawale",
                  'Arijit Singh,Pritam,Shilpa Rao', false),
              Song("url1_for_category_0", "Raabta", 'Arijit Singh,Pritam',
                  false),
              Song("url1_for_category_0", "Ghungroo", 'Arijit Singh,Shilpa Rao',
                  false),
              Song("url1_for_category_0", "Chahun Main Ya Naa",
                  'Arijit Singh,Palak Muchhal', false),
              Song(
                  "url1_for_category_0", "Ilahi", 'Arijit Singh,Pritam', false),
              Song("url1_for_category_0", "Main Rang Sharabton Ka",
                  'Arijit Singh,Pritam', false),
              Song("url1_for_category_0", "Shaayraana", 'Arijit Singh,Pritam',
                  false),
              Song("url1_for_category_0", "Phir Mohabbat",
                  'Arijit Singh,Mohammed Irfan,Saim Bhat', false),
              Song("url1_for_category_0", "Phir Bhi Tumko Chaahunga",
                  'Arijit Singh,Mithoon,Shashaa Tirupati', false),
            ];
            break;
          case 1:
            songs = [
              Song("url1_for_category_1", "FE!N", "Travis Scott, Playboi Carti",
                  true),
              Song(
                  "url1_for_category_1", "GOD'S COUNTRY", "Travis Scott", true),
              Song("url1_for_category_1", "MY EYES", "Travis Scott", true),
              Song("url1_for_category_1", "HYAENA", "Travis Scott", true),
              Song("url1_for_category_1", "TOPIA TWINS",
                  "Travis Scott, Rob49, 21 Savage", true),
              Song("url1_for_category_1", "CIRCUS MAXIMUS",
                  "Travis Scott, The Weeknd, Swae Lee", true),
              Song("url1_for_category_1", "K-POP",
                  "Travis Scott, Bad Bunny, The Weeknd", true),
            ];
            break;
          case 2:
            songs = [
              Song("url1_for_category_2", "3:59", "DIVINE", true),
              Song("url1_for_category_2", "Satya", "DIVINE", true),
              Song("url1_for_category_2", "Punya Paap", "DIVINE", false),
              Song("url1_for_category_2", "Mirchi",
                  "DIVINE, MC Altaf, Stylo G, Phenom", false),
              Song("url1_for_category_2", "Baazigar", "DIVINE, Armani White",
                  true),
              Song("url1_for_category_2", "Drill Karte", "DIVINE, dutchavelli",
                  false),
              Song("url1_for_category_2", "Kaam 25 - Sacred Games", "DIVINE",
                  false),
            ];
            break;
          case 3:
            songs = [
              Song(
                  "url1_for_category_3", "Not Like Us", "Kendrick Lamar", true),
              Song("url1_for_category_3", "family ties",
                  "Kendrick Lamar, Baby Keem", true),
              Song("url1_for_category_3", "HUMBLE.", "Kendrick Lamar", true),
              Song("url1_for_category_3", "Like That",
                  "Kendrick Lamar, Future, Metro Boomin", true),
              Song("url1_for_category_3", "Pray For Me",
                  "Kendrick Lamar, The Weeknd", true),
              Song("url1_for_category_3", "Don't Wanna Know",
                  "Kendrick Lamar, Maroon 5", false),
              Song("url1_for_category_3", "Poetic Justice",
                  "Kendrick Lamar, Drake", true),
            ];
            break;
          case 4:
            songs = [
              Song("url1_for_category_4", "Shape Of You", "Ed Sheeran", false),
              Song("url1_for_category_4", "Perfect", "Ed Sheeran", false),
              Song("url1_for_category_4", "Eraser", "Ed Sheeran", false),
              Song("url1_for_category_4", "Happier", "Ed Sheeran", false),
              Song("url1_for_category_4", "What Do I Know?", "Ed Sheeran",
                  false),
              Song("url1_for_category_4", "Let Her Go", "Ed Sheeran, Passenger",
                  false),
              Song("url1_for_category_4", "Castle on the Hill", "Ed Sheeran",
                  false),
            ];
            break;
          case 5:
            songs = [
              Song("url1_for_category_5", "Starboy", "The Weeknd", false),
              Song("url1_for_category_5", "Die For You", "The Weeknd", false),
              Song("url1_for_category_5", "Rockin'", "The Weeknd", false),
              Song("url1_for_category_5", "Blinding Lights", "The Weeknd",
                  false),
              Song("url1_for_category_5", "Stargirl Interlude",
                  "The Weeknd, Lana Del Ray", false),
              Song("url1_for_category_5", "I Feel It Coming",
                  "The Weeknd, Daft Punk", false),
              Song("url1_for_category_5", "Party Monster", "The Weeknd", false),
            ];
            break;
          default:
            songs = [Song("default_url1", "", "", false)];
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumView(
              title: category.name,
              imageUrl: category.imageURL,
              songInfo: songs,
              desc: category.desc,
              year: category.year,
              showTitle: category.showTitle,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff313131), // Dark grey background
          borderRadius: BorderRadius.circular(4), // Rounded corners
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(3)),
              child: Image.network(category.imageURL,
                  fit: BoxFit.contain), // Category image
            ),
            const SizedBox(width: 7),
            Flexible(
              //The Flexible widget is used here to make sure the text wraps within the available space.
              child: Text(
                category.name, // Category name
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
                overflow: TextOverflow.ellipsis, // Ellipsis if text is too long
                maxLines: 2, // Allow text to wrap to the next line
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Create a list of category widgets
  List<Widget> createListOfCategories(BuildContext context) {
    return categoryList.asMap().entries.map((entry) {
      int index = entry.key;
      Category category = entry.value;
      return createCategory(context, category, index);
    }).toList();
  }
/* => categoryList.asMap().entries creates an iterable of entries where each entry is a key-value pair of index and category.
   => entry.key provides the index.
   => entry.value provides the category.
   => createCategory(context, category, index) is called with the appropriate index for each category.
*/

  // Create a grid view of categories
  Widget createGrid(BuildContext context) {
    return Container(
      height: 200,
      width: 380,
      child: GridView.count(
        childAspectRatio: 7 / 2.2, // Aspect ratio for grid items
        crossAxisSpacing: 7,
        mainAxisSpacing: 7,
        crossAxisCount: 2, // Number of columns
        physics: const NeverScrollableScrollPhysics(), // Disable scrolling
        children: createListOfCategories(context), // Add category widgets
      ),
    );
  }

  // Create a widget for 'Made For You' music section
  Widget madeForYou(BuildContext context, MusicList music, int index) {
    return GestureDetector(
      onTap: () {
        List<Song> songs;
        switch (index) {
          case 0:
            songs = [
              Song("url1_for_music_0", "Here With Me", "Marshmello, CHVRCHES",
                  false),
            ];
            break;
          case 1:
            songs = [Song("url1_for_music_1", "", "", false)];
            break;
          case 2:
            songs = [Song("url1_for_music_2", "", "", false)];
            break;
          default:
            songs = [Song("default_url1", "", "", false)];
        }

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumView(
                title: music.name,
                imageUrl: music.imageURL,
                songInfo: songs,
                desc: music.description,
                year: music.year,
                showTitle: music.showTitle,
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 18.0, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: 180,
              child: CachedNetworkImage(
                  imageUrl: music.imageURL,
                  fit: BoxFit.cover), // Music cover image
            ),
            const SizedBox(height: 10),
            Text(music.name,
                style: const TextStyle(color: Colors.white)), // Music name
            Container(
              height: 40,
              width: 180,
              child: Flexible(
                child: Text(
                  music.desc,
                  style: const TextStyle(color: Colors.white54, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ), // Music description
          ],
        ),
      ),
    );
  }

  // Create the 'Made For You' music list section
  Widget createMusicList1(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: const Text(
            'Made For You', // Section title
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 260,
          child: ScrollConfiguration(
            behavior:
                NoOverscrollGlowBehavior(), // Disable overscroll glow effect
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Horizontal scrolling
              itemBuilder: (ctx, index) {
                return madeForYou(
                    context, musicList1[index], index); // Create music widgets
              },
              itemCount: musicList1.length, // Number of music items
            ),
          ),
        ),
      ],
    );
  }

  // Create a widget for 'Best Of Artists' music section
  Widget bestOfArtists(BuildContext context, MusicList music, int index) {
    return GestureDetector(
      onTap: () {
        List<Song> songs;
        switch (index) {
          case 0:
            songs = [
              Song("url1_for_music_0", "Here With Me", "Marshmello, CHVRCHES",
                  false),
              Song("url1_for_music_0", "FRIENDS", "Marshmello, Anne-Marie",
                  true),
              Song("url1_for_music_0", "Alone", "Marshmello", false),
              Song("url1_for_music_0", "Everyday", "Marshmello, Logic", true),
              Song("url1_for_music_0", "Summer", "Marshmello", false),
              Song("url1_for_music_0", "Alone", "Marshmello", false),
              Song("url1_for_music_0", "Wolves", "Marshmello, Selena Gomez",
                  false),
            ];
            break;
          case 1:
            songs = [
              Song(
                  "url1_for_music_1", "Best Song Ever", "One Direction", false),
              Song("url1_for_music_1", "Night Changes", "One Direction", false),
              Song("url1_for_music_1", "What makes You Beautiful",
                  "One Direction", false),
              Song("url1_for_music_1", "Drag Me Down", "One Direction", false),
              Song("url1_for_music_1", "No Control", "One Direction", false),
              Song("url1_for_music_1", "History", "One Direction", false),
              Song("url1_for_music_1", "Perfect", "One Direction", false),
            ];
            break;
          case 2:
            songs = [
              Song("url1_for_music_2", "That's What I Like", "Bruno Mars",
                  false),
              Song("url1_for_music_2", "Just the Way You Are", "Bruno Mars",
                  false),
              Song("url1_for_music_2", "24K Magic", "Bruno Mars", false),
              Song("url1_for_music_2", "Uptown Funk", "Bruno Mars,Mark Ronson",
                  true),
              Song("url1_for_music_2", "Grenade", "Bruno Mars", false),
              Song("url1_for_music_2", "Leave The Door Open",
                  "Bruno Mars, Anderson Paak, Silk Sonic", false),
              Song("url1_for_music_2", "Versace on the Floor", "Bruno Mars",
                  false),
            ];
            break;
          default:
            songs = [Song("default_url1", "", "", false)];
        }

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumView(
                title: music.name,
                imageUrl: music.imageURL,
                songInfo: songs,
                desc: music.description,
                year: music.year,
                showTitle: music.showTitle,
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 18.0, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: 180,
              child: Image.network(music.imageURL,
                  fit: BoxFit.cover), // Music cover image
            ),
            const SizedBox(height: 10),
            Text(music.name,
                style: const TextStyle(color: Colors.white)), // Music name
            Container(
              height: 40,
              width: 180,
              child: Flexible(
                child: Text(
                  music.desc,
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ), // Music description
          ],
        ),
      ),
    );
  }

  // Create the 'Best Of Artists' music list section
  Widget createMusicList2(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: const Text(
            'Best Of Artists', // Section title
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 260,
          child: ScrollConfiguration(
            behavior:
                NoOverscrollGlowBehavior(), // Disable overscroll glow effect
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Horizontal scrolling
              itemBuilder: (ctx, index) {
                return bestOfArtists(
                    context, musicList2[index], index); // Create music widgets
              },
              itemCount: musicList2.length, // Number of music items
            ),
          ),
        ),
      ],
    );
  }

// Create a widget for 'Popular' music section
  Widget popular(BuildContext context, MusicList music, int index) {
    return GestureDetector(
      onTap: () {
        List<Song> songs;
        switch (index) {
          case 0:
            songs = [Song("url1_for_music_0", "", "Jab We Met", false)];
            break;
          case 1:
            songs = [Song("url1_for_music_1", "", "", false)];
            break;
          case 2:
            songs = [Song("url1_for_music_2", "", "", false)];
            break;
          default:
            songs = [Song("default_url1", "", "", false)];
        }

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumView(
                title: music.name,
                imageUrl: music.imageURL,
                songInfo: songs,
                desc: music.description,
                year: music.year,
                showTitle: music.showTitle,
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 18.0, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: 180,
              child: Image.network(music.imageURL,
                  fit: BoxFit.cover), // Music cover image
            ),
            const SizedBox(height: 10),
            Text(music.name,
                style: const TextStyle(color: Colors.white)), // Music name
            Container(
              height: 40,
              width: 180,
              child: Flexible(
                child: Text(
                  music.desc,
                  style: const TextStyle(color: Colors.white54, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ), // Music description
          ],
        ),
      ),
    );
  }

// Create the 'Popular' music list section
  Widget createMusicList3(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: const Text(
            'Popular', // Section title
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 400,
          child: ScrollConfiguration(
            behavior:
                NoOverscrollGlowBehavior(), // Disable overscroll glow effect
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Horizontal scrolling
              itemBuilder: (ctx, index) {
                return popular(
                    context, musicList3[index], index); // Create music widgets
              },
              itemCount: musicList3.length, // Number of music items
            ),
          ),
        ),
      ],
    );
  }
}

// Custom ScrollBehavior to disable overscroll glow effect
class NoOverscrollGlowBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child; // Disable overscroll glow effect
  }
}
