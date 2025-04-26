
import 'package:flutter/material.dart';

class PPMStatus {
  final String label;
  final Color color;

  PPMStatus(this.label, this.color);
}

PPMStatus getPPMStatus(dynamic co2Level) {
  if (co2Level < 1000) {
    return PPMStatus('Good', Colors.green); // Low CO2 level (Good air quality)
  } else if (co2Level < 1500) {
    return PPMStatus('Fair', Colors.yellow); // Medium CO2 level
  } else if (co2Level < 2000) {
    return PPMStatus('Unhealthy for Sensitive Groups', Colors.orange); // High CO2 level
  } else {
    return PPMStatus('Hazardous', Colors.red); // Very High CO2 level (Dangerous air quality)
  }
}