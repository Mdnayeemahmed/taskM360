
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          scaffoldBackgroundColor: AppColors.backGroundColor,

          textTheme: const TextTheme(

              titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            bodyMedium: TextStyle(fontSize: 14),

          ),

          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: const EdgeInsets.symmetric(vertical: 6.0),
              // border: OutlineInputBorder(
              //   borderSide: BorderSide(color: AppColors.themeColor),
              // ),
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: AppColors.themeColor),
              // ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            isDense: true, // makes it tighter

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