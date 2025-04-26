import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskM360/app/app_colors.dart';
import 'package:taskM360/app/assets_path.dart';
import 'package:taskM360/features/home/ui/widgets/scale.dart';

import '../../data/models/place_model.dart';
import '../widgets/ppm_status.dart';

class ResultScreen extends StatefulWidget {
  static const String name = '/resultScreen';
  final Place place;
  const ResultScreen({Key? key, required this.place}) : super(key: key);


  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  // double co2Level = 450; // Current CO2 level
  // int totalPlants = 189;
  // int plantedPlants = 23;

  @override
  Widget build(BuildContext context) {
    final place = widget.place;
    final status = getPPMStatus(widget.place.ppm);
    // final status = getPPMStatus(co2Level);
    // Define the range for the indicator
    // double indicatorPosition = 0.5; // 50% as an example (middle position)
    // if (co2Level < 1000) {
    //   indicatorPosition = 0.1; // Low CO2 level (near the left)
    // } else if (co2Level < 1500) {
    //   indicatorPosition = 0.4; // Medium CO2 level
    // } else if (co2Level < 2000) {
    //   indicatorPosition = 0.7; // High CO2 level
    // } else {
    //   indicatorPosition = 1.0; // Very High CO2 level (near the right)
    // }

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new, color: AppColors.grayColor),
        backgroundColor: Colors.white, // Fixed background color
        elevation: 0, // Flat look
        toolbarHeight: MediaQuery.of(context).size.height < 800 ? 30 : 56,
        scrolledUnderElevation:0,
        automaticallyImplyLeading: false, // Optional: stops default back button if needed
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CO2 Level display
              Container(
                height: 200,
                child: Scale(ppm: place.ppm, containerWidth: 350, containerHeight: 10),
              ),
              SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${status.label}: ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: status.color,
                      ),
                    ),
                    TextSpan(
                      text: 'Your office is emitting a lot of Carbon Dioxide',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w300,
                        color: AppColors.grayColor,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40),

              // Plant section
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(AssetsPath.leaf),
                      backgroundColor: Color.fromRGBO(210, 255, 232, 1),
                    ),
                    Text(
                      '${place.totalPlants} indoor plants',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Your office emits ${place.ppm} Carbon dioxide everyday',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Text('Planted', textAlign: TextAlign.start),
                            Spacer(),
                            Text('${place.indoorPlants}/${place.totalPlants}',
                                textAlign: TextAlign.end),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Container(
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade300,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: LinearProgressIndicator(
                            value: place.totalPlants == 0
                                ? 0.0
                                : (place.indoorPlants >= place.totalPlants
                                ? 1.0
                                : place.indoorPlants / place.totalPlants),
                            backgroundColor: Colors.transparent,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFF47BA80),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*.15),

              // Done Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/homeScreen');
                  },
                  child: Text('Done'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class TrianglePointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =
        Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill;

    Path path =
        Path()
          ..moveTo(0, 0)
          ..lineTo(size.width, 0)
          ..lineTo(size.width / 2, size.height)
          ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
