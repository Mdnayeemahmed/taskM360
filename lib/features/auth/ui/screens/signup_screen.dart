import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskM360/app/assets_path.dart';
import 'package:taskM360/features/auth/ui/widgets/number_field.dart';
import 'package:taskM360/features/auth/ui/widgets/password_field.dart';

import '../controllers/auth_controller.dart';
import '../widgets/form_field.dart';


class SignUpScreen extends StatelessWidget {
  static const String name = '/signUpScreen';

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final authController = Get.find<AuthController>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController confirmController = TextEditingController();
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(left: 33, top: 87, right: 33),
        child: ListView(
          children: [
            Text(
              'Sign Up',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Let\'s save the environment together',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),

            // Name
            NormalTextField(
              label: "Name",
              hints: "e.g: Ahmed Ariyan",
              controller: nameController,
              onChanged: (v) => print("Name: $v"),
            ),
            const SizedBox(height: 10),

            // Phone
            PhoneNumberWidget(controller: phoneController),
            const SizedBox(height: 10),

            // Email
            NormalTextField(
              label: "Email",
              hints: "user@example.com",
              controller: emailController,
              onChanged: (v) => print("Email: $v"),
            ),
            const SizedBox(height: 10),

            // Password
            PasswordField(
              label: "Password",
              controller: passwordController,
              onChanged: (v) => print("Password: $v"),
            ),
            const SizedBox(height: 10),

            // Confirm Password
            PasswordField(
              label: "Confirm Password",
              controller: confirmController,           // ← fixed
              onChanged: (v) => print("Confirm: $v"),
            ),
            const SizedBox(height: 20),

            // Sign-Up Button
            Obx(() {
              return authController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                onPressed: () async {
                  if (passwordController.text != confirmController.text) {
                    Get.snackbar(
                      'Error',
                      'Passwords do not match',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    return;
                  }
                  final success = await authController.signUp(
                    nameController.text.trim(),
                    phoneController.text.trim(),
                    emailController.text.trim(),
                    passwordController.text,
                  );
                  if (success) {
                    Navigator.pushReplacementNamed(context, '/signInScreen');
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Sign Up'),
              );
            }),
            const SizedBox(height: 20),

            // Social Row
            Center(
              child: Column(
                children: [
                  const Text('Or Sign Up with'),
                  const SizedBox(height: 20),
                  Image.asset(AssetsPath.socialRow, width: 220),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Already have account?
            Center(
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/signInScreen'),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Logo at bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AssetsPath.logoNavPng,
                height: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
