import 'package:flutter/material.dart';
import 'package:taskM360/app/assets_path.dart';

class SplashScreen extends StatefulWidget {
  static const String name = '/';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/signInScreen'); // Or your named route
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Image.asset(
                AssetsPath.logoPng,
                width: 220,
                height: 220,
              ),
            ),
            Spacer(),
            FadeTransition(
              opacity: _fadeAnimation,
              child:  Image.asset(
                AssetsPath.logoNavPng,
                height: 17,
              ),
            ),
            SizedBox(
              height: 20,
            )

          ],
        ),
      ),
    );
  }
}