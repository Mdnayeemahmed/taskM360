import 'package:flutter/material.dart';
import 'package:taskM360/features/auth/ui/screens/verify_otp.dart';
import 'package:taskM360/features/home/data/models/place_model.dart';
import 'package:taskM360/features/home/ui/screens/home_screen.dart';

import '../features/auth/ui/screens/login_screen.dart';
import '../features/auth/ui/screens/otp_screen.dart';
import '../features/auth/ui/screens/reset_screen.dart';
import '../features/auth/ui/screens/signup_screen.dart';
import '../features/auth/ui/screens/splash_screen.dart';
import '../features/home/ui/screens/add_screen.dart';
import '../features/home/ui/screens/details_screen.dart';
import '../features/home/ui/screens/result_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget route;
    if (settings.name == SplashScreen.name) {
      route = const SplashScreen();
    } else if (settings.name == SignInScreen.name) {
      route = SignInScreen();
    } else if (settings.name == SignUpScreen.name) {
      route = SignUpScreen();
    } else if (settings.name == VerifyOTPScreen.name) {
      // String email = settings.arguments as String;
      route = VerifyOTPScreen();
    } else if (settings.name == HomeScreen.name) {
      route = HomeScreen();
    } else if (settings.name == DetailsScreen.name) {
      final args = settings.arguments as Map<String, dynamic>;
      final place = args['place'] as Place;
      final avatars = List<String>.from(args['avatars'] as List);
      route = DetailsScreen(place: place, avatars: avatars);

      // route = DetailsScreen(place: place);
    } else if (settings.name == AddScreen.name) {
      route = AddScreen();
    } else if (settings.name == ResultScreen.name) {
      final place = settings.arguments as Place;
      route = ResultScreen(place: place);

      // route = ResultScreen();
    } else if (settings.name == ResetPasswordScreen.name) {
      route = ResetPasswordScreen();
    }else if (settings.name == VerifyOTPScreen.name) {
      route = VerifyOTPScreen();
    }
    else if (settings.name == SendOTPScreen.name) {
      route = SendOTPScreen();
    }

    return MaterialPageRoute(
      builder: (context) {
        return route;
      },
    );
  }
}
