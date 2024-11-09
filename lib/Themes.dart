import 'package:flutter/material.dart';

class AppTheme {
  static final Color lightPrimaryColor = Colors.deepPurple;
  static final Color lightSecondaryColor = Color(0xFF03DAC6);

  static final Color darkPrimaryColor = Color(0xFFBB86FC);
  static final Color darkSecondaryColor = Color(0xFF03DAC6);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    colorScheme: ColorScheme.light(
      primary: lightPrimaryColor,
      secondary: lightSecondaryColor,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black87),
      bodyMedium: TextStyle(color: Colors.black87),
      bodySmall: TextStyle(color: Colors.black87),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    colorScheme: ColorScheme.dark(
      primary: darkPrimaryColor,
      secondary: darkSecondaryColor,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
    ),
    scaffoldBackgroundColor: Colors.black,
  );
}



class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme = AppTheme.lightTheme;
  bool _isDarkMode = false;

  ThemeData get theme => _currentTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _currentTheme = _isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;
    notifyListeners();
  }
}