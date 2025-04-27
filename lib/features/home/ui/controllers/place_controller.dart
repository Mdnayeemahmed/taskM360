import 'package:get/get.dart';

import '../../data/models/place_model.dart';
import 'dart:math';

/// Manages list of Places and form inputs
class PlaceController extends GetxController {
  // Three category lists
  final homePlaces = <Place>[].obs;
  final officePlaces = <Place>[].obs;
  final otherPlaces = <Place>[].obs;

  // Form inputs
  final title = 'Home'.obs;
  final people = 10.obs;
  final rooms = 30.obs;
  final area = 1500.obs;
  final ac = 40.obs;
  final refrigerator = 2.obs;
  final computers = 30.obs;
  final indoorPlants = 10.obs;
  final kitchenBurner = 0.obs;
  final avatarUrls = <String>[
    'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=300',
    'https://randomuser.me/api/portraits/men/32.jpg',
    'https://randomuser.me/api/portraits/women/44.jpg',
    'https://randomuser.me/api/portraits/men/57.jpg',
    'https://randomuser.me/api/portraits/men/57.jpg',
    'https://randomuser.me/api/portraits/men/57.jpg',
  ].obs;
  final selectedType = 'Home'.obs; // 'Home', 'Office', or 'Others'

  @override
  void onInit() {
    super.onInit();
    _seedMockData();
  }

  void _seedMockData() {
    // Generate 3 mock entries for each category dynamically
    const int seedCount = 1;
    for (int i = 1; i <= seedCount; i++) {
      homePlaces.add(Place(
        title: 'Home $i',
        people: 10 * i,
        rooms: 5 * i,
        area: 1500 * i,
        ac: 1 + i,
        refrigerator: i,
        computers: 2 * i,
        indoorPlants: 3 * i,
        percentChange:5,
        kitchenBurner: 1, ppm: 500,
      ));
      officePlaces.add(Place(
        title: 'Office $i',
        people: 20 * i,
        rooms: 10 * i,
        area: 5000 * i,
        ac: 2 + i,
        refrigerator: 1 + i,
        computers: 5 * i,
        indoorPlants: 5 * i,
        kitchenBurner: 0,
        percentChange:10,

        ppm: 700,
      ));
      otherPlaces.add(Place(
        title: 'Other $i',
        people: 5 * i,
        rooms: 2 * i,
        area: 800 * i,
        ac: i,
        refrigerator: 0,
        computers: i,
        percentChange: 20,
        indoorPlants: i,
        kitchenBurner: 0,
        ppm: 600,
      ));
    }
  }

  /// Adds a new place into the selected category list
  // void addPlace() {
  //   final rnd = Random();
  //
  //   final newPlace = Place(
  //     title: title.value,
  //     people: people.value,
  //     rooms: rooms.value,
  //     area: area.value,
  //     ac: ac.value,
  //     refrigerator: refrigerator.value,
  //     computers: computers.value,
  //     indoorPlants: indoorPlants.value,
  //     kitchenBurner: kitchenBurner.value,
  //     ppm: 400 + rnd.nextInt(1600), // random ppm between 400 and 1999
  //     totalPlants: 1 + rnd.nextInt(200)
  //   );
  //   switch (selectedType.value) {
  //     case 'Home':
  //       homePlaces.add(newPlace);
  //       break;
  //     case 'Office':
  //       officePlaces.add(newPlace);
  //       break;
  //     default:
  //       otherPlaces.add(newPlace);
  //
  //       return newPlace;
  //
  //   }
  // }

  Place addPlace() {
    final rnd = Random();
    final newPlace = Place(
      title: title.value,
      ppm: 400 + rnd.nextInt(1600),
      people: people.value,
      rooms: rooms.value,
      area: area.value,
      ac: ac.value,
      refrigerator: refrigerator.value,
      computers: computers.value,
      indoorPlants: indoorPlants.value,
      kitchenBurner: kitchenBurner.value,
      totalPlants: 1 + rnd.nextInt(200),
      percentChange: 1 + rnd.nextInt(20)

    );
    switch (selectedType.value) {
      case 'Home':
        homePlaces.add(newPlace);
        break;
      case 'Office':
        officePlaces.add(newPlace);
        break;
      default:
        otherPlaces.add(newPlace);
    }
    return newPlace;
  }
}