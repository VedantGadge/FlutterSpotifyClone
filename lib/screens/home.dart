import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone_app/models/category.dart';
import 'package:spotify_clone_app/models/musicList.dart';
import 'package:spotify_clone_app/screens/album.dart';
import 'package:spotify_clone_app/services/category_operations.dart';
import 'package:spotify_clone_app/services/musicList_operations1.dart';
import 'package:spotify_clone_app/services/musicList_operations2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Category> categoryList;
  late List<MusicList> musicList1;
  late List<MusicList> musicList2;

  @override
  void initState() {
    super.initState();
    // Initialize your data fetching or any other initialization here
    categoryList = CategoryOperations.getCategories();
    musicList1 = MusiclistOperations1.getMusic1();
    musicList2 = MusiclistOperations2.getMusic2();
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
                createMusicList2(context), // Second list of music
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
        String song1Url,
            song2Url,
            song3Url,
            albumDesc,
            song1imageUrl,
            song2imageUrl,
            song3imageUrl,
            song1name,
            song1singers,
            song2name,
            song2singers,
            song3name,
            song3singers;

        // Determine the song URLs based on the tapped category
        if (index == 0) {
          song1Url = "url1_for_category_0";
          song2Url = "url2_for_category_0";
          song3Url = '';
          albumDesc = '';
          song1imageUrl = '';
          song2imageUrl = '';
          song3imageUrl = '';
          song1name = '';
          song1singers = 'Arijit Singh';
          song2name = '';
          song2singers = '';
          song3name = '';
          song3singers = '';
        } else if (index == 1) {
          song1Url = "url1_for_category_1";
          song2Url = "url2_for_category_1";
          song3Url = '';
          albumDesc = '';
          song1imageUrl = '';
          song2imageUrl = '';
          song3imageUrl = '';
          song1name = '';
          song1singers = 'Travis Scott';
          song2name = '';
          song2singers = '';
          song3name = '';
          song3singers = '';
        } else if (index == 2) {
          song1Url = "url1_for_category_2";
          song2Url = "url2_for_category_2";
          song3Url = '';
          albumDesc = '';
          song1imageUrl = '';
          song2imageUrl = '';
          song3imageUrl = '';
          song1name = '';
          song1singers = 'DIVINE';
          song2name = '';
          song2singers = '';
          song3name = '';
          song3singers = '';
        } else if (index == 3) {
          song1Url = "url1_for_category_2";
          song2Url = "url2_for_category_2";
          song3Url = '';
          albumDesc = '';
          song1imageUrl = '';
          song2imageUrl = '';
          song3imageUrl = '';
          song1name = '';
          song1singers = 'Kendrick Lamar';
          song2name = '';
          song2singers = '';
          song3name = '';
          song3singers = '';
        } else if (index == 4) {
          song1Url = "url1_for_category_2";
          song2Url = "url2_for_category_2";
          song3Url = '';
          albumDesc = '';
          song1imageUrl = '';
          song2imageUrl = '';
          song3imageUrl = '';
          song1name = 'Shape Of You';
          song1singers = 'Ed Sheeran';
          song2name = '';
          song2singers = '';
          song3name = '';
          song3singers = '';
        } else if (index == 5) {
          song1Url = "url1_for_category_2";
          song2Url = "url2_for_category_2";
          song3Url = '';
          albumDesc = '';
          song1imageUrl = '';
          song2imageUrl = '';
          song3imageUrl = '';
          song1name = 'Blinding Lights';
          song1singers = 'The Weeknd';
          song2name = '';
          song2singers = '';
          song3name = '';
          song3singers = '';
        } else {
          // Default URLs or add more conditions as needed
          song1Url = "default_url1";
          song2Url = "default_url2";
          song3Url = '';
          albumDesc = '';
          song1imageUrl = '';
          song2imageUrl = '';
          song3imageUrl = '';
          song1name = '';
          song1singers = '';
          song2name = '';
          song2singers = '';
          song3name = '';
          song3singers = '';
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumView(
              title: category.name,
              imageUrl: category.imageURL,
              song1Url: song1Url,
              song2Url: song2Url,
              song3Url: song3Url,
              albumDesc: albumDesc,
              song1imageUrl: song1imageUrl,
              song2imageUrl: song2imageUrl,
              song3imageUrl: song3imageUrl,
              song1name: song1name,
              song1singers: song1singers,
              song2name: song2name,
              song2singers: song2singers,
              song3name: song3name,
              song3singers: song3singers,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff313131), // Dark grey background
          borderRadius: BorderRadius.circular(3), // Rounded corners
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
            Text(
              category.name, // Category name
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
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
        String song1Url,
            song2Url,
            song3Url,
            albumDesc,
            song1imageUrl,
            song2imageUrl,
            song3imageUrl,
            song1name,
            song1singers,
            song2name,
            song2singers,
            song3name,
            song3singers;

        if (index == 0) {
          song1Url = "url1_for_music_0";
          song2Url = "url2_for_music_0";
          song3Url = '';
          albumDesc = '';
          song1imageUrl = '';
          song2imageUrl = '';
          song3imageUrl = '';
          song1name = '';
          song1singers = '';
          song2name = '';
          song2singers = '';
          song3name = '';
          song3singers = '';
        } else if (index == 1) {
          song1Url = "url1_for_music_1";
          song2Url = "url2_for_music_1";
          song3Url = '';
          albumDesc = '';
          song1imageUrl = '';
          song2imageUrl = '';
          song3imageUrl = '';
          song1name = '';
          song1singers = '';
          song2name = '';
          song2singers = '';
          song3name = '';
          song3singers = '';
        } else if (index == 2) {
          song1Url = "url1_for_music_2";
          song2Url = "url2_for_music_2";
          song3Url = '';
          albumDesc = '';
          song1imageUrl = '';
          song2imageUrl = '';
          song3imageUrl = '';
          song1name = '';
          song1singers = '';
          song2name = '';
          song2singers = '';
          song3name = '';
          song3singers = '';
        } else {
          song1Url = "default_url1";
          song2Url = "default_url2";
          song3Url = '';
          albumDesc = '';
          song1imageUrl = '';
          song2imageUrl = '';
          song3imageUrl = '';
          song1name = '';
          song1singers = '';
          song2name = '';
          song2singers = '';
          song3name = '';
          song3singers = '';
        }

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumView(
                title: music.name,
                imageUrl: music.imageURL,
                song1Url: song1Url,
                song2Url: song2Url,
                song3Url: song3Url,
                albumDesc: albumDesc,
                song1imageUrl: song1imageUrl,
                song2imageUrl: song2imageUrl,
                song3imageUrl: song3imageUrl,
                song1name: song1name,
                song1singers: song1singers,
                song2name: song2name,
                song2singers: song2singers,
                song3name: song3name,
                song3singers: song3singers,
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
            Text(music.description,
                style: const TextStyle(
                    color: Colors.white54, fontSize: 13)), // Music description
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
        String song1Url,
            song2Url,
            song3Url,
            albumDesc,
            song1imageUrl,
            song2imageUrl,
            song3imageUrl,
            song1name,
            song1singers,
            song2name,
            song2singers,
            song3name,
            song3singers;

        if (index == 0) {
          song1Url = "url1_for_music_0";
          song2Url = "url2_for_music_0";
          song3Url = '';
          albumDesc = '';
          song1imageUrl = '';
          song2imageUrl = '';
          song3imageUrl = '';
          song1name = '';
          song1singers = '';
          song2name = '';
          song2singers = '';
          song3name = '';
          song3singers = '';
        } else if (index == 1) {
          song1Url = "url1_for_music_1";
          song2Url = "url2_for_music_1";
          song3Url = '';
          albumDesc = '';
          song1imageUrl = '';
          song2imageUrl = '';
          song3imageUrl = '';
          song1name = '';
          song1singers = '';
          song2name = '';
          song2singers = '';
          song3name = '';
          song3singers = '';
        } else if (index == 2) {
          song1Url = "url1_for_music_2";
          song2Url = "url2_for_music_2";
          song3Url = '';
          albumDesc = '';
          song1imageUrl = '';
          song2imageUrl = '';
          song3imageUrl = '';
          song1name = '';
          song1singers = '';
          song2name = '';
          song2singers = '';
          song3name = '';
          song3singers = '';
        } else {
          song1Url = "default_url1";
          song2Url = "default_url2";
          song3Url = '';
          albumDesc = '';
          song1imageUrl = '';
          song2imageUrl = '';
          song3imageUrl = '';
          song1name = '';
          song1singers = '';
          song2name = '';
          song2singers = '';
          song3name = '';
          song3singers = '';
        }

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumView(
                title: music.name,
                imageUrl: music.imageURL,
                song1Url: song1Url,
                song2Url: song2Url,
                song3Url: song3Url,
                albumDesc: albumDesc,
                song1imageUrl: song1imageUrl,
                song2imageUrl: song2imageUrl,
                song3imageUrl: song3imageUrl,
                song1name: song1name,
                song1singers: song1singers,
                song2name: song2name,
                song2singers: song2singers,
                song3name: song3name,
                song3singers: song3singers,
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
            Text(music.description,
                style: const TextStyle(
                    color: Colors.white54, fontSize: 13)), // Music description
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
          height: 400,
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
}

// Custom ScrollBehavior to disable overscroll glow effect
class NoOverscrollGlowBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child; // Disable overscroll glow effect
  }
}
