import 'package:flutter/material.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
   /* useMaterial3: true,
    primaryColor: ColorsManager.mainRed,
    hintColor: ColorsManager.hint,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryTextTheme: const TextTheme(
      // headline1: TextStyle(
      //     fontSize: 28, color: Colors.black, fontWeight: FontWeight.w900),
      // headline2: TextStyle(
      //     fontSize: 24, color: Colors.black, fontWeight: FontWeight.w900),
      // headline3: TextStyle(
      //     fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
      // headline4: TextStyle(
      //     fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
      // headline5: TextStyle(
      //     fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
      // headline6: TextStyle(
      //   fontSize: 14,
      //   color: Colors.black,
      // ),
      // subtitle1: TextStyle(
      //   fontSize: 16,
      //   color: Colors.black,
      // ),
      // subtitle2: TextStyle(
      //   fontSize: 16,
      //   color: Colors.black,
      // ),
      // bodyText1: TextStyle(
      //   fontSize: 16,
      //   color: Colors.black,
      // ),
      // bodyText2: TextStyle(
      //   fontSize: 14,
      //   color: Colors.black,
      // ),
      // button: TextStyle(
      //     fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
    
    ),

    fontFamily: context.locale.languageCode == "ar"
              ? AppStrings.arabicFont
              : AppStrings.englishFont,
    textTheme: TextTheme(
      bodyMedium: TextStyle(
          height: 1.3,
          fontSize: 22,
          fontFamily: context.locale.languageCode == "ar"
              ? AppStrings.arabicFont
              : AppStrings.englishFont,
          color: Colors.black,
          fontWeight: FontWeight.bold),
    ),
    appBarTheme: AppBarTheme(
        centerTitle: false,
        color: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(
            fontFamily: context.locale.languageCode == "ar"
              ? AppStrings.arabicFont
              : AppStrings.englishFont,
            color: ColorsManager.mainRed,
            fontSize: 20,
            fontWeight: FontWeight.w500)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: ColorsManager.lightScaffoldBackgroundColor,
        elevation: 0,
        selectedIconTheme: IconThemeData(
          color: ColorsManager.mainRed,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.black,
        ),
        selectedItemColor: ColorsManager.mainRed,
        unselectedItemColor: Colors.black),

    //fontFamily: 'jannah',*/
  );
}
