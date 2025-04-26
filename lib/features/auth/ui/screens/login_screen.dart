import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskM360/app/app_colors.dart';

import '../../../../app/assets_path.dart';
import '../controllers/auth_controller.dart';
import '../widgets/form_field.dart';
import '../widgets/password_field.dart';

class SignInScreen extends StatelessWidget {
  static const String name = '/signInScreen';

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    final TextEditingController passwordController = TextEditingController();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 33, top: 87, right: 33),
        child: ListView(
          children: [
            // Title
            Text(
              'Sign In',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),

            // Subtitle
            Text(
              'Let\'s save the environment together',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),

            // Email field
            NormalTextField(
              label: "Email",
              hints: "user@example.com",
              controller: emailController,
              onChanged: (value) => print("Email: $value"),
            ),
            const SizedBox(height: 20),

            // Password field
            PasswordField(
              label: "Password",
              controller: passwordController,
              onChanged: (value) => print("Password: $value"),
            ),
            const SizedBox(height: 20),

            // Remember + Forgot
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Checkbox(
                        value: true,
                        onChanged: (_) {},
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Remember me',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: "Inter",
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signOTPScreen');
                  },
                  child: Text(
                    'Forgotten Password',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: AppColors.themeColor,
                      fontFamily: "Inter",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Sign In button
            Obx(() {
              return authController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                onPressed: () async {
                  final success = await authController.signIn(
                    emailController.text.trim(),
                    passwordController.text,
                  );
                  if (success) {
                    Navigator.pushReplacementNamed(
                        context, '/homeScreen');
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Sign In'),
              );
            }),
            const SizedBox(height: 20),

            // Social sign-in
            Center(
              child: Column(
                children: [
                  const Text('Or Sign In with'),
                  const SizedBox(height: 20),
                  Image.asset(AssetsPath.socialRow, width: 220),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Navigate to Sign Up
            Center(
              child: TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/signUpScreen'),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Logo at bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AssetsPath.logoNavPng,
                height: 17,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
