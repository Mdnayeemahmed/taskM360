import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskM360/app/assets_path.dart';

import '../../../../app/app_colors.dart';
import '../../../auth/ui/controllers/auth_controller.dart';
import '../controllers/place_controller.dart';
import '../widgets/airquality_card.dart';
import 'add_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String name = '/homeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final ctrl = Get.find<PlaceController>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,

                  child: Image.asset(
                    AssetsPath.headerCard,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: SizedBox(
                      height:
                          MediaQuery.of(context).size.height *
                          0.25, // Match image height for centering
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          // This centers it vertically
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Good Morning',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium?.copyWith(
                                        color: AppColors.grayColor,
                                      ),
                                    ),
                                    Obx(() {
                                      final user =
                                          authController.userModel.value;
                                      return Text(
                                        user != null
                                            ? user.name
                                            : 'Ahmed Ariyan',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleLarge?.copyWith(
                                          color: AppColors.textColor,
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                                Image.asset(
                                  AssetsPath.profile,
                                  height: 98,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                            // const SizedBox(height: 16),
                            Text.rich(
                              TextSpan(
                                text: 'You are in a ',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.grayColor,
                                  fontWeight: FontWeight.w700,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'healthy',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium?.copyWith(
                                      color: AppColors.themeColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const TextSpan(text: ' environment'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Obx(() {
              final allPlaces = [
                ...ctrl.homePlaces,
                ...ctrl.officePlaces,
                ...ctrl.otherPlaces,
              ];

              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Places',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.textColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                          allPlaces.map((place) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: AirQualityCard(
                                title: place.title,
                                ppmValue: place.ppm,
                                percentChange: place.rooms,
                                status: 'Good',
                                avatarUrls: ctrl.avatarUrls,
                                onViewDetails: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/detailsScreen',
                                    arguments: {
                                      'place': place,
                                      'avatars': ctrl.avatarUrls.toList(),
                                    },
                                  );
                                },
                              ),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              );
            }),
            // Padding(
            //   padding: const EdgeInsets.all(24.0),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "My Places",
            //         style: Theme.of(context).textTheme.titleMedium?.copyWith(
            //           color: AppColors.textColor,
            //           fontWeight: FontWeight.w300,
            //         ),
            //       ),
            //       SizedBox(height: 10),
            //
            //       AirQualityCard(
            //         title: 'Home',
            //         ppmValue: 652,
            //         percentChange: 13,
            //         status: 'Good',
            //         avatarUrls: [
            //           'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
            //           'https://example.com/user2.png',
            //           'https://example.com/user3.png',
            //           'https://example.com/user3.png',
            //           'https://example.com/user3.png',
            //         ],
            //         onViewDetails: () {
            //           print('Details clicked!');
            //         },
            //       ),
            //       SizedBox(height: 10),
            //
            //       AirQualityCard(
            //         title: 'Home',
            //         ppmValue: 652,
            //         percentChange: 13,
            //         status: 'Good',
            //         avatarUrls: [
            //           'https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D',
            //           'https://example.com/user2.png',
            //           'https://example.com/user3.png',
            //           'https://example.com/user3.png',
            //           'https://example.com/user3.png',
            //           'https://example.com/user3.png',
            //         ],
            //         onViewDetails: () {
            //           print('Details clicked!');
            //         },
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to perform when button is pressed
          Navigator.pushNamed(context, '/addScreen'); // Or your named route
        },
        backgroundColor: AppColors.themeColor, // Optional styling
        child: Icon(Icons.add, color: Colors.white), // Replace with any icon
      ),
    );
  }
}
