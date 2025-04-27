import 'package:flutter/material.dart';

import '../../../../app/assets_path.dart';
import '../widgets/form_field.dart';




class SendOTPScreen extends StatelessWidget {
  static const String name = '/signOTPScreen';

  const SendOTPScreen({super.key});

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
              'Send Otp',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 30
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Recover your account in easy steps',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                fontFamily: "Inter",

              ),
            ),
            Spacer(),

            NormalTextField(
              label: "Email",
              hints:"user@example.com",
              controller: passwordController,
              onChanged: (value) {
                print("Password: $value");
              },
            ),

            Spacer(),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/verifyOTPScreen'); // Or your named route

              },
              child: Text('Send Otp'),
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


