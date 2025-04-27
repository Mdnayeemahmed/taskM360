import 'package:flutter/material.dart';

import '../../../../app/assets_path.dart';
import '../widgets/otp_pin_box.dart';

// OTP Input Box Widget

class VerifyOTPScreen extends StatelessWidget {
  static const String name = '/verifyOTPScreen';

  const VerifyOTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    fontFamily: "Inter",
                  ),
            ),
            Spacer(),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'An email has been sent to ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontFamily: "Inter",
                    ),
                  ),
                  TextSpan(
                    text: 'user@example.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600, // Optional: make it a bit bolder if you want
                    ),
                  ),
                  TextSpan(
                    text: '. Please enter the sent OTP.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontFamily: "Inter",
                    ),
                  ),
                ],
              ),
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
                Navigator.pushReplacementNamed(
                    context, '/resetPasswordScreen'); // Or your named route
              },
              child: Text('Send Otp'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 20),

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
