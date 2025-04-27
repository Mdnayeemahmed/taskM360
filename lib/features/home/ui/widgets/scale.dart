
import 'dart:developer';

import 'package:flutter/material.dart';

class Scale extends StatelessWidget {
  final int ppm;
  final double containerWidth;
  final double containerHeight;
  final double sizeOfPointer;
  final bool ppmStatus;

  // PPM thresholds for each color
  static const int greenMax = 1000;    // 0-1000 ppm
  static const int yellowMax = 1500;   // 1000-1500 ppm
  static const int orangeMax = 2000;   // 1500-2000 ppm
  static const int redMax = 3000;      // 2000-3000 ppm

  const Scale({
    super.key,
    required this.ppm,
    required this.containerWidth,
    required this.containerHeight,
    this.ppmStatus = true,
    this.sizeOfPointer = 40,
  });

  Color getColorForCO2(int co2Level) {
    if (co2Level < greenMax) return Colors.green;
    if (co2Level < yellowMax) return Colors.yellow;
    if (co2Level < orangeMax) return Colors.orange;
    return Colors.red;
  }

  List<double> getPointerPositions() {
    final totalWidth = containerWidth;



    final sectionWidths = [
      (greenMax / redMax) * totalWidth,
      ((yellowMax - greenMax) / redMax) * totalWidth,
      ((orangeMax - yellowMax) / redMax) * totalWidth,
      ((redMax - orangeMax) / redMax) * totalWidth,
    ];

    return [
      sectionWidths[0] * 0.5,
      sectionWidths[0] + sectionWidths[1] * 0.5,
      sectionWidths[0] + sectionWidths[1] + sectionWidths[2] * 0.5,
      totalWidth - sectionWidths[0],
    ];
  }
  int getCurrentSectionIndex() {
    if (ppm <= greenMax) return 0;
    if (ppm <= yellowMax) return 1;
    if (ppm <= orangeMax) return 2;
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    final currentSection = getCurrentSectionIndex();
    final pointerPositions = getPointerPositions();
    final iconColor = getColorForCO2(ppm);
    log(pointerPositions.toString());
    log(currentSection.toString());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (ppmStatus) _buildPpmDisplay(ppm, iconColor, context),
            SizedBox(
              height: 30,
              width: containerWidth,
              child: Stack(
                children: [
                  // Green pointer
                  Positioned(
                    left: pointerPositions[0] - sizeOfPointer / 2,
                    bottom: 0,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: currentSection == 0 ? Colors.green : Colors.transparent,
                      size: sizeOfPointer,
                    ),
                  ),
                  // Yellow pointer
                  Positioned(
                    left: pointerPositions[1] - sizeOfPointer / 2,
                    bottom: 0,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: currentSection == 1 ? Colors.yellow : Colors.transparent,
                      size: sizeOfPointer,
                    ),
                  ),
                  // Orange pointer
                  Positioned(
                    left: pointerPositions[2] - sizeOfPointer / 2,
                    bottom: 0,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: currentSection == 2 ? Colors.orange : Colors.transparent,
                      size: sizeOfPointer,
                    ),
                  ),
                  // Red pointer
                  Positioned(
                    left: pointerPositions[3] - sizeOfPointer / 25,
                    bottom: 0,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: currentSection == 3 ? Colors.red : Colors.transparent,
                      size: sizeOfPointer,
                    ),
                  ),
                ],
              ),
            ),
            _buildColorScale(),
          ],
        ),
      ),
    );
  }

  Widget _buildColorScale() {
    return SizedBox(
      width: containerWidth,
      height: containerHeight,
      child: Row(
        children: [
          Expanded(child: Container(color: Colors.green)),
          _buildDivider(),
          Expanded(child: Container(color: Colors.yellow)),
          _buildDivider(),
          Expanded(child: Container(color: Colors.orange)),
          _buildDivider(),
          Expanded(child: Container(color: Colors.red)),
        ],
      ),
    );
  }

  Widget _buildPpmDisplay(int ppm, Color color, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$ppm',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.w300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            'ppm',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: color,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(width: 2, height: double.infinity, color: Colors.white);
  }
}