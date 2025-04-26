import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskM360/app/app_colors.dart';
import 'package:taskM360/app/assets_path.dart';
import 'package:taskM360/features/home/ui/screens/result_screen.dart';

import '../controllers/place_controller.dart';
//
// class AddScreen extends StatefulWidget {
//   static const String name = '/addScreen';
//
//   @override
//   _AddScreenState createState() =>
//       _AddScreenState();
// }
//
// class _AddScreenState extends State<AddScreen> {
//   int totalPeople = 10;
//   int totalRooms = 50;
//   int totalArea = 10000;
//   int totalAC = 40;
//   int totalRefrigerator = 10;
//   int totalComputers = 0;
//   int totalIndoorPlants = 0;
//   int totalKitchenBurner = 0;
//
//   // Controllers for each field to manage text input
//   TextEditingController totalPeopleController = TextEditingController();
//   TextEditingController totalRoomsController = TextEditingController();
//   TextEditingController totalAreaController = TextEditingController();
//   TextEditingController totalACController = TextEditingController();
//   TextEditingController totalRefrigeratorController = TextEditingController();
//   TextEditingController totalComputersController = TextEditingController();
//   TextEditingController totalIndoorPlantsController = TextEditingController();
//   TextEditingController totalKitchenBurnerController = TextEditingController();
//   String selectedValue = 'Office';
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize controllers with existing values
//     totalPeopleController.text = totalPeople.toString();
//     totalRoomsController.text = totalRooms.toString();
//     totalAreaController.text = totalArea.toString();
//     totalACController.text = totalAC.toString();
//     totalRefrigeratorController.text = totalRefrigerator.toString();
//     totalComputersController.text = totalComputers.toString();
//     totalIndoorPlantsController.text = totalIndoorPlants.toString();
//     totalKitchenBurnerController.text = totalKitchenBurner.toString();
//   }
//
//   void calculateCarbonEmissions() {
//     Navigator.pushNamed(context, '/resultScreen'); // Or your named route
//
//     // Get.to(CarbonDioxideScreen());
//     // Logic for calculating carbon emissions can go here
//     // For now, it just prints the values
//     // print("Calculating Carbon Emission...");
//     // print("Total People: $totalPeople");
//     // print("Total Rooms: $totalRooms");
//     // print("Total Area: $totalArea sqft");
//     // print("Total ACs: $totalAC");
//     // print("Total Refrigerators: $totalRefrigerator");
//     // print("Total Computers: $totalComputers");
//     // print("Total Indoor Plants: $totalIndoorPlants");
//     // print("Total Kitchen Burners: $totalKitchenBurner");
//   }
//
//   void updateValue(TextEditingController controller, Function(int) onChanged) {
//     final value = int.tryParse(controller.text) ?? 0;
//     onChanged(value);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.arrow_back_ios_new, color: AppColors.grayColor),
//         backgroundColor: Colors.white, // Fixed background color
//         elevation: 0,
//         toolbarHeight: MediaQuery.of(context).size.height < 800 ? 30 : 56,
//         scrolledUnderElevation:0,
//         // title: Text('Office'),
//         // backgroundColor: Color(0xFF004445),
//       ),
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Image.asset(AssetsPath.officeIcon, height: 60),
//                         SizedBox(width: 10),
//                         DropdownButton<String>(
//                           value: selectedValue,
//                           onChanged: (String? newValue) {
//                             setState(() {
//                               selectedValue = newValue!;
//                             });
//                           },
//                           items:
//                               <String>[
//                                 'Home',
//                                 'Office',
//                                 'Others',
//                               ].map<DropdownMenuItem<String>>((String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               }).toList(),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // All your input fields here
//                   buildInputField(
//                     'Total number of people',
//                     totalPeopleController,
//                     (value) {
//                       setState(() {
//                         totalPeople = value;
//                       });
//                     },
//                   ),
//                   buildInputField(
//                     'Total number of rooms',
//                     totalRoomsController,
//                     (value) {
//                       setState(() {
//                         totalRooms = value;
//                       });
//                     },
//                   ),
//                   buildInputField('Total area (sqft)', totalAreaController, (
//                     value,
//                   ) {
//                     setState(() {
//                       totalArea = value;
//                     });
//                   }),
//                   buildInputField('Total AC', totalACController, (value) {
//                     setState(() {
//                       totalAC = value;
//                     });
//                   }),
//                   buildInputField(
//                     'Total Refrigerator',
//                     totalRefrigeratorController,
//                     (value) {
//                       setState(() {
//                         totalRefrigerator = value;
//                       });
//                     },
//                   ),
//                   buildInputField('Total Computers', totalComputersController, (
//                     value,
//                   ) {
//                     setState(() {
//                       totalComputers = value;
//                     });
//                   }),
//                   buildInputField(
//                     'Total Indoor Plants',
//                     totalIndoorPlantsController,
//                     (value) {
//                       setState(() {
//                         totalIndoorPlants = value;
//                       });
//                     },
//                   ),
//                   buildInputField(
//                     'Total Kitchen Burner',
//                     totalKitchenBurnerController,
//                     (value) {
//                       setState(() {
//                         totalKitchenBurner = value;
//                       });
//                     },
//                   ),
//                   SizedBox(height: 150),
//                   // To give scroll space below the button
//                 ],
//               ),
//             ),
//           ),
//
//           // 🎯 Fixed positioned button
//           Positioned(
//             bottom: 20,
//             left: 16,
//             right: 16,
//             child:             ElevatedButton(
//               onPressed:calculateCarbonEmissions,
//               child: Text('Calculate Carbon Emission'),
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(double.infinity, 50),
//               ),
//             ),
//
//
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildInputField(
//     String label,
//     TextEditingController controller,
//     Function(int) onChanged,
//   ) {
//     final labelParts = RegExp(r'^(.*?)(\s*\(.*\))?$').firstMatch(label);
//     final mainText = labelParts?.group(1) ?? label;
//     final unitText = labelParts?.group(2) ?? '';
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Icon(Icons.circle, color: AppColors.bulletColors),
//           SizedBox(width: 5),
//           Expanded(
//             child: RichText(
//               overflow: TextOverflow.ellipsis,
//               text: TextSpan(
//                 style: Theme.of(context).textTheme.bodyMedium,
//                 children: [
//                   TextSpan(text: mainText),
//                   if (unitText.isNotEmpty)
//                     TextSpan(
//                       text: unitText,
//                       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                         color: AppColors.grayColor,
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(width: 5),
//           Row(
//             children: [
//               InkResponse(
//                 onTap: () {
//                   int value = int.tryParse(controller.text) ?? 0;
//                   value--;
//                   controller.text = value.toString();
//                   updateValue(controller, onChanged);
//                 },
//                 child: Container(
//                   height: 33,
//                   child: Image.asset(AssetsPath.minusButton),
//                 ),
//               ),
//               Center(
//                 child: SizedBox(
//                   width: 80,
//                   child: TextField(
//                     controller: controller,
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     onChanged: (value) => updateValue(controller, onChanged),
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       isDense: true,
//                       contentPadding: EdgeInsets.symmetric(vertical: 10.0),
//                     ),
//                     style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                       fontWeight: FontWeight.w300,
//                     ),
//                   ),
//                 ),
//               ),
//               InkResponse(
//                 onTap: () {
//                   int value = int.tryParse(controller.text) ?? 0;
//                   value++;
//                   controller.text = value.toString();
//                   updateValue(controller, onChanged);
//                 },
//                 child: Container(
//                   height: 33,
//                   child: Image.asset(AssetsPath.plusButton),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


class AddScreen extends StatelessWidget {
  static const String name = '/addScreen';

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<PlaceController>();

    Widget buildField(String label, RxInt val) {
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
                    TextSpan(text: label),
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
        leading: BackButton(color: AppColors.grayColor),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
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
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // ctrl.addPlace();
                  final newPlace = ctrl.addPlace();
                  Navigator.pushNamed(context,'/resultScreen', arguments: newPlace);

                },
                child: Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}