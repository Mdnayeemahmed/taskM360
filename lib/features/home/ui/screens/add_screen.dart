import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskM360/app/app_colors.dart';
import 'package:taskM360/app/assets_path.dart';

import '../controllers/place_controller.dart';


class AddScreen extends StatelessWidget {
  static const String name = '/addScreen';

  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<PlaceController>();

    Widget buildField(String label, RxInt val) {
      // Find text inside parentheses
      final RegExp regex = RegExp(r'\(([^)]+)\)');
      final match = regex.firstMatch(label);

      String beforeParenthesis = label;
      String insideParenthesis = '';

      if (match != null) {
        beforeParenthesis = label.substring(0, match.start).trim();
        insideParenthesis = label.substring(match.start, match.end); // Keep parentheses
      }

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.circle, color: AppColors.bulletColors),
            SizedBox(width: 5),
            Expanded(
              child: RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(text: beforeParenthesis + ' '), // normal text
                    if (insideParenthesis.isNotEmpty)
                      TextSpan(
                        text: insideParenthesis,
                        style: TextStyle(color: Colors.grey), // parentheses text gray
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 5),
            Row(
              children: [
                InkResponse(
                  onTap: () {
                    val.value = (val.value - 1).clamp(0, val.value);
                  },
                  child: Container(
                    height: 33,
                    child: Image.asset(AssetsPath.minusButton),
                  ),
                ),
                Center(
                  child: Obx(
                        () => SizedBox(
                      width: 80,
                      child: Text(
                        val.value.toString(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
                InkResponse(
                  onTap: () {
                    val.value++;
                  },
                  child: Container(
                    height: 33,
                    child: Image.asset(AssetsPath.plusButton),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new, size: 24),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(AssetsPath.officeIcon, height: 60),
                    SizedBox(width: 10),
                    Obx(
                          () => DropdownButton<String>(
                        value: ctrl.selectedType.value,
                        onChanged: (String? newValue) {
                          if (newValue != null) ctrl.selectedType.value = newValue;
                        },
                        items: <String>['Home', 'Office', 'Others']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              buildField('Total People', ctrl.people),
              buildField('Total Rooms', ctrl.rooms),
              buildField('Area (sqft)', ctrl.area),
              buildField('AC units', ctrl.ac),
              buildField('Refrigerators', ctrl.refrigerator),
              buildField('Computers', ctrl.computers),
              buildField('Indoor Plants', ctrl.indoorPlants),
              buildField('Kitchen Burners', ctrl.kitchenBurner),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final newPlace = ctrl.addPlace();
                    Navigator.pushNamed(context,'/resultScreen', arguments: newPlace);

                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}