import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../data/models/place_model.dart';

/// Provides data for the Details screen, including the selected Place
class DetailsController extends GetxController {
  final Place place;

  DetailsController(this.place);

  // Example chart data; could be derived or fetched per place
  final dataSpots = <FlSpot>[
    FlSpot(0, 2),
    FlSpot(1, 3),
    FlSpot(2, 5),
    FlSpot(3, 4),
    FlSpot(4, 4.2),
    FlSpot(5, 4.5),
    FlSpot(6, 1.8),
  ];

  // Example avatars; could map from place data if available
  final avatarUrls = <String>[].obs;

  final bottomTitles = <int, String>{
    0: 'Oct\n24',
    1: 'Nov\n24',
    2: 'Dec\n24',
    3: 'Jan\n25',
    4: 'Feb\n25',
    5: 'Mar\n25',
    6: 'Apr\n25',
  };
}