import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify_clone_app/screens/album.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: CustomScrollView(
          scrollBehavior: NoGlowScrollBehavior(),
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 8, top: 10, bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Search',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      width: 240,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
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
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    color: Colors.blue,
                    height: 500,
                  ),
                  Container(
                    color: Colors.yellow,
                    height: 500,
                  )
                ],
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
          hintStyle: GoogleFonts.roboto(
            textStyle: const TextStyle(
              color: Colors.black54,
              fontSize: 17.5,
              fontWeight: FontWeight.w700,
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(11),
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
