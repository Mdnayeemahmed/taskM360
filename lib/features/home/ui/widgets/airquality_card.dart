import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskM360/app/assets_path.dart';
import 'package:taskM360/features/home/ui/screens/details_screen.dart';
import 'package:taskM360/features/home/ui/widgets/stacked_images.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class AirQualityCard extends StatelessWidget {
  final String title;
  final int ppmValue;
  final int percentChange;
  final String status;
  final List<String> avatarUrls;
  final VoidCallback onViewDetails;

  const AirQualityCard({
    super.key,
    required this.title,
    required this.ppmValue,
    required this.percentChange,
    required this.status,
    required this.avatarUrls,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    // Determine max avatars to show and overflow
    // int showCount;
    // int extraCount = 0;
    //
    // if (avatarUrls.length <= 4) {
    //   showCount = avatarUrls.length;
    // } else if (avatarUrls.length == 5) {
    //   showCount = 3;
    //   extraCount = 2;
    // } else if (avatarUrls.length == 6) {
    //   showCount = 5;
    //   extraCount = 1;
    // } else {
    //   showCount = 5;
    //   extraCount = avatarUrls.length - 5;
    // }

    final screenWidth = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 700; // Adjust threshold as needed

    int showCount;
    int extraCount = 0;

    if (isSmallScreen) {
      // Small screen: Show up to 3 avatars
      showCount = avatarUrls.length <= 3 ? avatarUrls.length : 3;
      extraCount = avatarUrls.length > 3 ? avatarUrls.length - 3 : 0;
    } else {
      // Existing logic for larger screens
      if (avatarUrls.length <= 4) {
        showCount = avatarUrls.length;
      } else if (avatarUrls.length == 5) {
        showCount = 3;
        extraCount = 2;
      } else if (avatarUrls.length == 6) {
        showCount = 5;
        extraCount = 1;
      } else {
        showCount = 5;
        extraCount = avatarUrls.length - 5;
      }
    }

    final avatarWidgets = avatarUrls.take(showCount).map((url) {
      return CircleAvatar(
        radius: 24,
        backgroundColor: Colors.white,
        child: CircleAvatar(radius: 22, backgroundImage: NetworkImage(url)),
      );
    }).toList();


    if (extraCount > 0) {
      avatarWidgets.add(
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 22,
            backgroundColor: Colors.grey.shade400,
            child: Text(
              '+$extraCount',
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      );
    }

    return InkResponse(
      onTap: onViewDetails,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFF8FFFB), Color(0xFFFFFFFF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0x0D000000),
              offset: const Offset(0, 3),
              blurRadius: 10,
              spreadRadius: -2,
            ),
          ],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top: Title and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF42D58B),
                        Color(0xFF65D49C), // 42.51%
                        Color(0xFF47BA80), // 99.99%
                        Color(0xFF2DF28F), // 100%
                        // 0%
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // PPM & Change + Avatars
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ppmValue.toString(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.deepThemeColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 48,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                ' $percentChange%',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'ppm',
                          style: Theme.of(
                            context,
                          ).textTheme.titleMedium?.copyWith(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Stacked Avatars
                StackedWidgets(
                  items: avatarWidgets,
                  size: 36,
                  xShift: 15,
                  direction: TextDirection.rtl,
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, // Aligns children to the left
                children: [
                  Text(
                    "View Details",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.deepThemeColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                    textDirection: TextDirection.ltr, // Changed to left-to-right for consistency
                  ),
                  SizedBox(width: 5),
                  Image.asset(AssetsPath.arrowRight, height: 10),
                ],
              ),
            )          ],
        ),
      ),
    );
  }
}
