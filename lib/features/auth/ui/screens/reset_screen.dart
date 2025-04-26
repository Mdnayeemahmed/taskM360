import 'package:flutter/material.dart';

import '../../../../app/assets_path.dart';
import '../widgets/password_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String name = '/resetPasswordScreen';

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(left: 33.0,top: 87,right: 33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reset your password',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 30
        ),
            ),
            Spacer(),


            PasswordField(
              label: "New Password",
              controller: passwordController,
              onChanged: (value) {
                print("Password: $value");
              },
            ),
            SizedBox(
              height: 20,
            ),
            PasswordField(
              label: "Confirm Password",
              controller: passwordController,
              onChanged: (value) {
                print("Password: $value");
              },
            ),
            Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/signInScreen'); // Or your named route

              },
              child: Text('Reset Password'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            Spacer(),
            Align(
                alignment: Alignment.bottomCenter,
                child:Image.asset(
                  AssetsPath.logoNavPng,
                  height: 17,
                )),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}




