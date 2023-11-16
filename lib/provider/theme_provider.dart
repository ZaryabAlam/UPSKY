import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.lightBlue,
    fontFamily: GoogleFonts.dosis().fontFamily,
    appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey.shade300),
    primaryColorDark: Colors.black,
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.grey, opacity: 0.9),
    buttonTheme: ButtonThemeData(
        buttonColor: Colors.red, // Set the button color for light theme
        textTheme: ButtonTextTheme.primary),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
            Colors.black), // Set text color for light theme
      ),
    ),
  );

  static final lightTheme = ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.lightBlue,
    fontFamily: GoogleFonts.dosis().fontFamily,
    appBarTheme: AppBarTheme(backgroundColor: Colors.blue.shade300),
    primaryColorDark: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.yellow, opacity: 0.9),
    buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue, // Set the button color for light theme
        textTheme: ButtonTextTheme.primary),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(
            Colors.white), // Set text color for light theme
      ),
    ),
  );
}
