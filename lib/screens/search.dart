import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_clone_app/screens/album.dart'; // Adjust import as per your project structure

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  // Dummy data for categories
  final List<String> categories = [
    'Pop',
    'Rock',
    'Hip Hop',
    'Electronic',
    'Jazz',
    'Classical',
    'Folk',
    'Country',
    'R&B',
    'Reggae',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: CustomScrollView(
          scrollBehavior: const ScrollBehavior(),
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 8, top: 10, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(width: 240),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: SearchBarHeaderDelegate(),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.2, // Aspect ratio of each grid item
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      // Placeholder color
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/categories_thumbnail/Love.jpg',
                        scale: 3,
                      ),
                    ),
                  );
                },
                childCount: categories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 5.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'What do you want to listen to?',
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(11),
          hintStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(11.5),
            child: SvgPicture.asset('assets/icons/search.svg'),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60.0;

  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}












/*
In Flutter, slivers are the building blocks for creating intricate scrollable layouts. They offer more flexibility and control compared to standard widgets when it comes to scrolling behavior.

Here's a breakdown of each concept:

Sliver:

Represents a portion of a scrollable area.
Think of it as a slice that contributes to the overall scrolling content.
There are various built-in slivers like SliverList (for lists), SliverGrid (for grids), and SliverAppBar (for app bars).
Slivers are designed to work with CustomScrollView which manages the overall scrolling behavior.

SliverToBoxAdapter:

A specific type of sliver that acts as an adapter for a single child box widget.
It allows you to integrate a standard box widget (like Text or Row) into the scrollable area managed by slivers.
While useful for simple elements, it's generally less efficient for large datasets compared to slivers like SliverList which optimize rendering for visible items.

Delegate (SliverPersistentHeaderDelegate):

Used with SliverPersistentHeader to define the behavior of a persistent header in a scrollable view.
A delegate class specifies how the header should be built, its minimum and maximum extent (size), and how it behaves during scrolling (pinned, floating, etc.).
In the code you provided:

SliverToBoxAdapter is used to display the search title ("Search") and the search icon at the top.
SliverPersistentHeader with a custom SearchBarHeaderDelegate is used to create the search bar that remains visible while scrolling (due to the pinned: true property).
By combining different slivers and their delegates, you can achieve complex scrolling experiences with various header behaviors and content layouts.
*/