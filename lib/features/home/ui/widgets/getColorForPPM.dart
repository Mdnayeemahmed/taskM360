import 'package:flutter/material.dart';

Color getColorForPPM(int ppm) {
  if (ppm < 200) {
    return Colors.deepPurple;
  } else if (ppm < 400) {
    return Colors.red;
  } else if (ppm < 600) {
    return Colors.green;
  } else if (ppm < 800) {
    return Colors.yellow;
  } else if (ppm < 1000) {
    return Colors.orange;
  } else {
    return Colors.blue;
  }
}
