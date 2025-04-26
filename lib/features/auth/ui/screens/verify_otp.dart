import 'package:flutter/material.dart';
import 'package:taskM360/app/app_colors.dart';

import '../../../../app/assets_path.dart';

// OTP Input Box Widget
class OTPInputBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: AppColors.grayColor, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: AppColors.themeColor, width: 1.0),
          ),
          counterText: "",
        ),
        maxLength: 1,
        keyboardType: TextInputType.number,
        obscureText: true,
      ),
    );
  }
}

class VerifyOTPScreen extends StatelessWidget {
  static const String name = '/verifyOTPScreen';

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 33.0, top: 87, right: 33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verify Otp',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Recover your account in easy steps',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 14,
              ),
            ),
            Spacer(),
            Text(
              'An email has been sent to user@example.com. Please enter the sent OTP.',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OTPInputBox(),
                OTPInputBox(),
                OTPInputBox(),
                OTPInputBox(),
              ],
            ),

            Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/resetPasswordScreen'); // Or your named route

              },
              child: Text('Send Otp'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Didn’t Receive a code? ',
                        style: TextStyle(
                          color: Colors.black,
                        ), // or your desired color
                      ),
                      TextSpan(
                        text: 'Resend',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(AssetsPath.logoNavPng, height: 17),
            ),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
