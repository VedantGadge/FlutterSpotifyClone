import 'package:flutter/material.dart';
import 'package:spotify_clone_app/models/genres.dart';

class GenreOperations {
  GenreOperations._();
  static List<Genres> getGenres() {
    return <Genres>[
      Genres(
        genre: 'Music',
        imageURL: 'assets/categories_thumbnail/TTH.jpg',
        bgcolor: const Color(0xffdc148c),
        title1: "",
        title2: "",
        listViewImgs1: [
          ['assets/categories_thumbnail/TTH.jpg']
        ],
        listViewImgs2: [],
      ),
      Genres(
        genre: 'Music',
        imageURL: 'assets/categories_thumbnail/TTH.jpg',
        bgcolor: const Color(0xffdc148c),
        title1: "",
        title2: "",
        listViewImgs1: [],
        listViewImgs2: [],
      ),
      Genres(
        genre: 'Party',
        imageURL: 'assets/categories_thumbnail/Party.jpg',
        bgcolor: const Color(0xff8c67ac),
        title1: "Popular Party Playlists",
        title2: "Dance Party",
        listViewImgs1: [
          [
            'assets/categories_thumbnail/PartyImg1.jpg',
            'Bollywood Dance Music',
            '843,945 followers',
          ],
          [
            'assets/categories_thumbnail/PartyImg2.jpg',
            'Dance Pop Hits',
            '509,181 followers',
          ],
          [
            'assets/categories_thumbnail/PartyImg3.jpg',
            'Party Hard',
            '423,974 followers',
          ],
          [
            'assets/categories_thumbnail/PartyImg4.jpg',
            '90s Dance Party',
            '1,245,,828 followers',
          ],
        ],
        listViewImgs2: [
          [
            'assets/categories_thumbnail/PartyImg5.jpg',
            'Pop Party',
            '694,502 followers',
          ],
          [
            'assets/categories_thumbnail/PartyImg6.jpg',
            'I-Pop Party',
            '191,565 followers',
          ],
          [
            'assets/categories_thumbnail/PartyImg7.jpg',
            'Dance Hits',
            '3,915,559 followers'
          ],
          [
            'assets/categories_thumbnail/PartyImg8.jpg',
            'Psytrance Supernova',
            '548,015 followers',
          ],
        ],
      ),
      Genres(
        genre: 'Punjabi',
        imageURL: 'assets/categories_thumbnail/Punjabi.jpg',
        bgcolor: const Color(0xffb02897),
        title1: "Popular Punjabi playlists",
        title2: "Punjabi Pop",
        listViewImgs1: [
          [
            'assets/categories_thumbnail/PunjabiImg1.jpg',
            'Hot Hits Punjabi',
            '1,083,430 followers',
          ],
          [
            'assets/categories_thumbnail/PunjabiImg2.jpg',
            'Punjabi Pop',
            '159,219 followers',
          ],
          [
            'assets/categories_thumbnail/PunjabiImg3.jpg',
            'Mega Punjabi Hits',
            '343,306 followers',
          ],
          [
            'assets/categories_thumbnail/PunjabiImg4.jpg',
            'Punjabi Swag',
            '183,,828 followers',
          ],
        ],
        listViewImgs2: [
          [
            'assets/categories_thumbnail/PunjabiImg5.jpg',
            'Party Hits Punjabi',
            '73,639 followers',
          ],
          [
            'assets/categories_thumbnail/PunjabiImg6.jpg',
            'Punjabi X',
            '262,540 followers',
          ],
          [
            'assets/categories_thumbnail/PunjabiImg7.jpg',
            'Hip Te Hop',
            '487,729 followers'
          ],
          [
            'assets/categories_thumbnail/PunjabiImg8.jpg',
            'Trending Now Punjabi',
            '202,296 followers',
          ],
        ],
      ),
      Genres(
        genre: 'Charts',
        imageURL: 'assets/categories_thumbnail/Charts.jpg',
        bgcolor: const Color(0xff8c67ac),
        title1: "",
        title2: "",
        listViewImgs1: [],
        listViewImgs2: [],
      ),
      Genres(
        genre: 'Hindi',
        imageURL: 'assets/categories_thumbnail/Hindi.jpg',
        bgcolor: const Color(0xffdc148c),
        title1: "Popular Hindi Playlists",
        title2: "New & Trending",
        listViewImgs1: [
          [
            'assets/categories_thumbnail/HindiImg4.jpg',
            'Hot Hits Hindi',
            '2,227,577 followers',
          ],
          [
            'assets/categories_thumbnail/HindiImg1.jpg',
            'Bollywood Mush',
            '1,354,744 followers',
          ],
          [
            'assets/categories_thumbnail/HindiImg3.jpg',
            'Bollywood Central',
            '1,343,306 followers',
          ],
          [
            'assets/categories_thumbnail/HindiImg8.jpg',
            '90s Love Hits',
            '515,828 followers',
          ],
        ],
        listViewImgs2: [
          [
            'assets/categories_thumbnail/HindiImg2.jpg',
            'New Music Hindi',
            '827,974 followers',
          ],
          [
            'assets/categories_thumbnail/HindiImg5.jpg',
            'Bollywood Sundowner',
            '227,639 followers',
          ],
          [
            'assets/categories_thumbnail/HindiImg6.jpg',
            'New in dance',
            '539,567 followers',
          ],
          [
            'assets/categories_thumbnail/HindiImg7.jpg',
            'All Out Hindi 00s',
            '640,530 followers',
          ],
        ],
      ),
      Genres(
        genre: 'Telugu',
        imageURL: 'assets/categories_thumbnail/Telugu.jpg',
        bgcolor: const Color(0xffb45b07),
        title1: "Popular Telugu Playlists",
        title2: "Telugu essentials",
        listViewImgs1: [
          [
            'assets/categories_thumbnail/TeluguImg1.jpeg',
            'Hot Hits Telugu',
            '440,708 followers',
          ],
          [
            'assets/categories_thumbnail/TeluguImg2.jpeg',
            'Trending Now Telugu',
            '121,538 followers',
          ],
          [
            'assets/categories_thumbnail/TeluguImg3.jpeg',
            'Telugu Love Songs',
            '293,034 followers',
          ],
          [
            'assets/categories_thumbnail/TeluguImg4.jpeg',
            'Telugu Party Time',
            '675,928 followers',
          ],
        ],
        listViewImgs2: [
          [
            'assets/categories_thumbnail/TeluguImg5.jpeg',
            'Latest Tamil',
            '768,344 followers',
          ],
          [
            'assets/categories_thumbnail/TeluguImg6.jpeg',
            'All Out 00\'s Telugu',
            '323,235 followers',
          ],
          [
            'assets/categories_thumbnail/TeluguImg7.jpeg',
            'Latest Telugu',
            '539,567 followers',
          ],
          [
            'assets/categories_thumbnail/TeluguImg8.jpeg',
            'Kiraak Telugu',
            '320,536 followers',
          ],
        ],
      ),
      Genres(
        genre: 'Malayalam',
        imageURL: 'assets/categories_thumbnail/Malayalam.jpg',
        bgcolor: const Color(0xff416f86),
        title1: "",
        title2: "",
        listViewImgs1: [],
        listViewImgs2: [],
      ),
      Genres(
        genre: 'Summer',
        imageURL: 'assets/categories_thumbnail/Summer.jpg',
        bgcolor: const Color(0xff27856a),
        title1: "",
        title2: "",
        listViewImgs1: [],
        listViewImgs2: [],
      ),
      Genres(
        genre: 'Discover',
        imageURL: 'assets/categories_thumbnail/Discover.jpg',
        bgcolor: const Color(0xff8c67ac),
        title1: "",
        title2: "",
        listViewImgs1: [],
        listViewImgs2: [],
      ),
      Genres(
        genre: 'Tamil',
        imageURL: 'assets/categories_thumbnail/Tamil.jpg',
        bgcolor: const Color(0xffa56752),
        title1: "",
        title2: "",
        listViewImgs1: [],
        listViewImgs2: [],
      ),
      Genres(
        genre: 'Chill',
        imageURL: 'assets/categories_thumbnail/Chill.jpg',
        bgcolor: const Color(0xffb06339),
        title1: "",
        title2: "",
        listViewImgs1: [],
        listViewImgs2: [],
      ),
      Genres(
        genre: 'Music',
        imageURL: 'assets/categories_thumbnail/TTH.jpg',
        bgcolor: const Color(0xffdc148c),
        title1: "",
        title2: "",
        listViewImgs1: [],
        listViewImgs2: [],
      ),
      Genres(
        genre: 'Music',
        imageURL: 'assets/categories_thumbnail/TTH.jpg',
        bgcolor: const Color(0xffdc148c),
        title1: "",
        title2: "",
        listViewImgs1: [],
        listViewImgs2: [],
      ),
      Genres(
        genre: 'Music',
        imageURL: 'assets/categories_thumbnail/TTH.jpg',
        bgcolor: const Color(0xffdc148c),
        title1: "",
        title2: "",
        listViewImgs1: [],
        listViewImgs2: [],
      ),
      Genres(
        genre: 'Music',
        imageURL: 'assets/categories_thumbnail/TTH.jpg',
        bgcolor: const Color(0xffdc148c),
        title1: "",
        title2: "",
        listViewImgs1: [],
        listViewImgs2: [],
      ),
    ];
  }
}
