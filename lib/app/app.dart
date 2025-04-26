
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskM360/features/auth/ui/screens/login_screen.dart';
import 'package:taskM360/features/auth/ui/screens/otp_screen.dart';
import 'package:taskM360/features/auth/ui/screens/reset_screen.dart';
import 'package:taskM360/features/auth/ui/screens/signup_screen.dart';
import 'package:taskM360/features/auth/ui/screens/verify_otp.dart';

import '../features/auth/ui/screens/splash_screen.dart';
import '../features/home/ui/screens/details_screen.dart';
import '../features/home/ui/screens/home_screen.dart';
import '../features/home/ui/screens/result_screen.dart';
import '../features/home/ui/widgets/scale.dart';
import 'app_colors.dart';
import 'app_routes.dart';
import 'controller_binder.dart';

class TaskM360 extends StatefulWidget {
  const TaskM360({super.key});

  @override
  State<TaskM360> createState() => _TaskM360State();
}

class _TaskM360State extends State<TaskM360> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: ThemeData(
        fontFamily: "Poppins",
          colorSchemeSeed: AppColors.themeColor,
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(

              titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            bodyMedium: TextStyle(fontSize: 14),

          ),

          inputDecorationTheme: const InputDecorationTheme(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              // border: OutlineInputBorder(
              //   borderSide: BorderSide(color: AppColors.themeColor),
              // ),
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: AppColors.themeColor),
              // ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.themeColor),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey
              )
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(


            style: ElevatedButton.styleFrom(
              textStyle:Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16
            ),


                fixedSize: const Size.fromWidth(double.maxFinite),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                foregroundColor: Colors.white,
                backgroundColor: AppColors.buttonColors

            ),

          ),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white
          )
      ),
      // localizationsDelegates: const [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // locale: const Locale('en'),
      // supportedLocales: const [Locale('en'), Locale('bn')],
      initialBinding: ControllerBinder(),
    );
  }
}