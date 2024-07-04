import 'package:spotify_clone_app/models/category.dart';

class CategoryOperations {
  CategoryOperations._() {} //Writing the constructor withm '._' so that the constructor remains private, and does not gets tampered later on.
  static List<Category> getCategories() {
    return <Category>[
      Category(
          name: 'This Is \nArijit Singh',
          imageURL:
              'https://i.scdn.co/image/ab67706f0000000285c716247c24f66ef40f011e'),
      Category(
          name: 'UTOPIA',
          imageURL:
              'https://i.scdn.co/image/ab67616d0000b273881d8d8378cd01099babcd44'),
      Category(
          name: 'Punya Paap',
          imageURL:
              'https://i.scdn.co/image/ab67616d0000b27383c726c3768d0981c76acd38'),
      Category(
          name: 'This is \nKendrick Lamar',
          imageURL:
              'https://thisis-images.spotifycdn.com/37i9dQZF1DZ06evO1IPOOk-default.jpg'),
      Category(
          name: '÷ (Deluxe)',
          imageURL:
              'https://i.scdn.co/image/ab67616d0000b273ba5db46f4b838ef6027e6f96'),
      Category(
          name: 'Starboy',
          imageURL:
              'https://i.scdn.co/image/ab67616d0000b2734718e2b124f79258be7bc452'),
    ];
  }
}
