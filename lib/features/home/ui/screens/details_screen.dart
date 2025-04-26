import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskM360/app/assets_path.dart';
import 'package:taskM360/features/home/ui/widgets/scale.dart';

import '../../../../app/app_colors.dart';
import '../../data/models/place_model.dart';
import '../controllers/details_controller.dart';
import '../widgets/stacked_images.dart';

class DetailsScreen extends StatefulWidget {
  static const String name = '/detailsScreen';
  final Place place;
  final List<String> avatars;

  const DetailsScreen({Key? key, required this.place,    required this.avatars,
  }) : super(key: key);


  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // final List<FlSpot> dataSpots = [
  //   FlSpot(0, 2), // Start of actual data at x = 0, y = 2
  //   FlSpot(1, 3),
  //   FlSpot(2, 5),
  //   FlSpot(3, 4),
  //   FlSpot(4, 4.2),
  //   FlSpot(5, 4.5),
  //   FlSpot(6, 1.8),
  // ];
  //
  //
  // final Map<int, String> bottomTitles = {
  //   0: 'Oct\n24',
  //   1: 'Nov\n24',
  //   2: 'Dec\n24',
  //   3: 'Jan\n25',
  //   4: 'Feb\n25',
  //   5: 'Mar\n25',
  //   6: 'Apr\n25',
  // };

  @override
  Widget build(BuildContext context) {
    final place = widget.place;
    final ctrl = Get.put(DetailsController(place));
    int showCount;
    int extraCount = 0;
    //
    // if (ctrl.avatarUrls.length <= 4) {
    //   showCount = ctrl.avatarUrls.length;
    // } else if (ctrl.avatarUrls.length == 5) {
    //   showCount = 3;
    //   extraCount = 2;
    // } else if (ctrl.avatarUrls.length == 6) {
    //   showCount = 5;
    //   extraCount = 1;
    // } else {
    //   showCount = 5;
    //   extraCount = ctrl.avatarUrls.length - 5;
    // }
    //
    // final avatarWidgets =
    // ctrl.avatarUrls.take(showCount).map((url) {
    //       return CircleAvatar(
    //         radius: 24,
    //         backgroundColor: Colors.white,
    //         child: CircleAvatar(radius: 22, backgroundImage: NetworkImage(url)),
    //       );
    //     }).toList();

    // if (extraCount > 0) {
    //   avatarWidgets.add(
    //     CircleAvatar(
    //       radius: 24,
    //       backgroundColor: Colors.white,
    //       child: CircleAvatar(
    //         radius: 22,
    //         backgroundColor: Colors.grey.shade400,
    //         child: Text(
    //           '+$extraCount',
    //           style: const TextStyle(color: Colors.white, fontSize: 14),
    //         ),
    //       ),
    //     ),
    //   );
    // }


    if (widget.avatars.length <= 4) {
      showCount = widget.avatars.length;
    } else if (widget.avatars.length == 5) {
      showCount = 3;
      extraCount = 2;
    } else if (widget.avatars.length == 6) {
      showCount = 5;
      extraCount = 1;
    } else {
      showCount = 5;
      extraCount = widget.avatars.length - 5;
    }

    // 2) Build the visible avatar widgets
    final avatarWidgets = widget.avatars
        .take(showCount)
        .map((url) => CircleAvatar(
      radius: 16,
      backgroundColor: Colors.white,
      child: CircleAvatar(radius: 14, backgroundImage: NetworkImage(url)),
    ))
        .toList();

    // 3) If there’s overflow, add the +N badge
    if (extraCount > 0) {
      avatarWidgets.add(
        CircleAvatar(
          radius: 16,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 14,
            backgroundColor: Colors.grey.shade400,
            child: Text(
              '+$extraCount',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
      );
    }

    return Scaffold(

      backgroundColor: Color.fromRGBO(250, 255, 253, 1),
      // appBar: AppBar(
      //   automaticallyImplyLeading: false, // <-- Disable default back button
      //   title: Row(
      //     children: [
      //       IconButton(
      //         icon: const Icon(Icons.arrow_back_ios),
      //         onPressed: () => Navigator.pop(context),
      //       ),
      //       const SizedBox(width: 8), // <-- Space between back button and home icon
      //       Image.asset(AssetsPath.homeButton, height: 28),
      //       const SizedBox(width: 10),
      //       Text(
      //         "Home",
      //         style: Theme.of(context).textTheme.titleLarge,
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     Container(
      //       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      //       margin: const EdgeInsets.only(right: 10), // <-- Margin to push inside
      //       decoration: BoxDecoration(
      //         gradient: const LinearGradient(
      //           colors: [
      //             Color(0xFF42D58B),
      //             Color(0xFF65D49C),
      //             Color(0xFF47BA80),
      //             Color(0xFF2DF28F),
      //           ],
      //         ),
      //         borderRadius: BorderRadius.circular(20),
      //       ),
      //       child: Text(
      //         "Good",
      //         style: Theme.of(context).textTheme.titleMedium?.copyWith(
      //           color: Colors.white,
      //           fontWeight: FontWeight.w700,
      //           fontSize: 12,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

          /// Custom Header
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Image.asset(AssetsPath.homeButton, height: 28),
                  const SizedBox(width: 8),
                  Text(
                    "Home",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF42D58B),
                      Color(0xFF65D49C),
                      Color(0xFF47BA80),
                      Color(0xFF2DF28F),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Good",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
                    children: [
                      Container(
                        height: 100,
                        // width: 92,
                        alignment: Alignment.center, // Optional, center the text inside
                        child: Text(
                          place.ppm.toString(),
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.deepThemeColor,
                            fontWeight: FontWeight.w300,
                            fontSize: 48,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center, // Center contents
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.buttonColors,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Image.asset(AssetsPath.dropDownIcon, height: 5),
                                Text(
                                  ' 13%',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'ppm',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    height: 100,
                    width: 132,

                    child: Scale(
                      ppm: place.ppm,
                      ppmStatus: false,
                      sizeOfPointer: 20,
                      containerWidth: 132,
                      containerHeight: 21,
                    ),
                  ),

                ],

              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "History",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.grayColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "See All",
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            color: AppColors.grayColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 5),
                        Image.asset(AssetsPath.arrowRight, height: 10),
                      ],
                    ),
                  ],
                ),
              ),
          
              SizedBox(
                height: 220,
                child: Stack(
                  children: [
                    // Chart
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      child: LineChart(
                        LineChartData(
                          minX: -1,
                          maxX: 6,
                          minY: 0,
                          maxY: 6,
                          lineBarsData: [
                            LineChartBarData(
                              spots: [FlSpot(-1, 1), ...ctrl.dataSpots],


                              isCurved: true,
                              curveSmoothness: 0.4,
                              preventCurveOverShooting: true,
                              color: Color.fromRGBO(109, 253, 181, 1),
                              barWidth: 2,
                              belowBarData: BarAreaData(show: false),
                              dotData: FlDotData(
                                show: true,
                                getDotPainter: (spot, percent, barData, index) {
                                  // Hide dot only for (0, 0)
                                  if (spot.x == -1 && spot.y == 1) {
                                    return FlDotCirclePainter(
                                      radius: 0, // Zero radius = invisible
                                      color: Colors.transparent,
                                      strokeColor: Colors.transparent,
                                      strokeWidth: 0,
                                    );
                                  }
                                  return FlDotCirclePainter(
                                    radius: 5,
                                    color: Colors.white,
                                    strokeColor: Color.fromRGBO(45, 242, 143, 1),
          
                                    strokeWidth: 2,
                                  );
                                },
                              ),
                            ),
                          ],
                          gridData: FlGridData(
                            show: true,
                            drawHorizontalLine: true,
                            drawVerticalLine: true,
                            getDrawingHorizontalLine:
                                (value) => FlLine(
                                  color: Colors.green.withOpacity(0.15),
                                  strokeWidth: 1,
                                ),
                            getDrawingVerticalLine:
                                (value) => FlLine(
                                  color: Colors.transparent,
                                  strokeWidth: 1,
                                ),
                          ),
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                interval: 1,
                                reservedSize: 38,
                                getTitlesWidget: (value, meta) {
                                  if (value.toInt() < 0) return const SizedBox();
                                  return SideTitleWidget(
                                    meta: meta,
                                    space: 6,
                                    child: Text(
                                      ctrl.bottomTitles[value.toInt()] ?? '',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(217, 217, 217, 1),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          borderData: FlBorderData(
                            show: true,
                            border: const Border(
                              bottom: BorderSide(
                                color: Color.fromRGBO(217, 217, 217, 1),
                              ),
                              left: BorderSide(
                                color: Color.fromRGBO(217, 217, 217, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
          
                    // Overlay vertical lines up to each dot, connected to the border
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 24,
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          // Get the exact same dimensions the chart uses
                          final chartWidth = constraints.maxWidth;
                          // final chartHeight = constraints.maxHeight;
          
                          // These must match your chart's min/max values
                          final minX = -1.0;
                          final maxX = 6.0;
                          final minY = 0.0;
                          final maxY = 6.0;
                          final paddingTop =
                              8.0; // Adjust based on titlesData/reservedSpace
                          final paddingBottom =
                              32.0; // Adjust based on AxisTitles bottom
                          final chartHeight =
                              constraints.maxHeight - paddingTop - paddingBottom;
                          final yRange = 6.0; // maxY - minY
                          return Stack(
                            children:
                                ctrl.dataSpots.map((spot) {
                                  // Calculate X position (account for padding and scale)
                                  final xPercent =
                                      (spot.x - minX) / (maxX - minX);
                                  final dx = xPercent * chartWidth;
          
                                  // Calculate Y position (chart coordinates are inverted)
                                  final yPercent =
                                      (spot.y - minY) / (maxY - minY);
                                  final dy =
                                      paddingTop +
                                      (1 - (spot.y / yRange)) * chartHeight;
          
                                  return Positioned(
                                    left: dx - 0.5, // Center the 1px line
                                    top: dy,
                                    child: Container(
                                      width: 1,
                                      height: chartHeight - dy,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color:
                                              Colors
                                                  .transparent, // Color is transparent for gradient border
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                        // Optional: if you want rounded borders
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xFF2DF28F),
                                            // #2DF28F
                                            Color(0x1A6DFDB5),
                                            // rgba(109, 253, 181, 0.05)
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
          
              SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 150,
                      margin: const EdgeInsets.only(right: 8), // Small gap between cards
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Persons",
                            style: TextStyle(
                              fontSize: 22, // Reduced for better fit on small screens
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(77, 77, 77, 1),
                            ),
                          ),
                          const SizedBox(height: 12),
                          StackedWidgets(
                            items: avatarWidgets,
                            size: 32, // Slightly smaller avatars
                            xShift: 12, // Shift based on size
                            direction: TextDirection.rtl,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 150,
                      margin: const EdgeInsets.only(left: 8), // Small gap between cards
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetsPath.box),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Rooms",
                              style: TextStyle(
                                fontSize: 22, // Slightly reduced
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              ctrl.place.rooms.toString(),
                              style: TextStyle(
                                fontSize: 40, // Slightly reduced
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: Text(
                                "2 of them requires action",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: AppColors.themeColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          
              SizedBox(height: 20),
              Container(
                // Outer container with white background
                // padding: EdgeInsets.all(16),
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white, // White background
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Plants',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppColors.themeColor,
                              ),
                            ),
          
                            Image.asset(AssetsPath.leaf, height: 55),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
          
                    // Left container for Icon and label with green background
                    Container(
                      height: 180,
                      width: 162,
          
                      // padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AssetsPath.box),
                          // Set the image from assets
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          ctrl.place.indoorPlants.toString(),
                          style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    // Right container for the number with a large font
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
