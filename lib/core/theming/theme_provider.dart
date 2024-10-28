import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  bool isDark = true;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    isDark = isOn ? true: false;
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    fontFamily: 'DancingScript',
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    cardColor: Colors.grey[800],
    highlightColor: Colors.orangeAccent,
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8), bottomAppBarTheme: BottomAppBarTheme(color: Colors.blueGrey[100]),
  );

  static final lightTheme = ThemeData(
    fontFamily: 'DancingScript',
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    cardColor: Colors.blueGrey[100],
    highlightColor: Colors.deepOrange,
    iconTheme: IconThemeData(color: Colors.red, opacity: 0.8), bottomAppBarTheme: BottomAppBarTheme(color: Colors.blueGrey[800]),
  );
}
