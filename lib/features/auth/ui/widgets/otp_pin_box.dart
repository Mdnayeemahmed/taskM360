import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class OTPInputBox extends StatelessWidget {
  const OTPInputBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
