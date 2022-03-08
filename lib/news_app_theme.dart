import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsAppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
        fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.black),
    headline1: GoogleFonts.openSans(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline2: GoogleFonts.openSans(
        fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline3: GoogleFonts.openSans(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black),
    headline4: GoogleFonts.openSans(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline6: GoogleFonts.openSans(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
        fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.grey),
    headline1: GoogleFonts.openSans(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.grey),
    headline2: GoogleFonts.openSans(
        fontSize: 24.0, fontWeight: FontWeight.w700, color: Colors.grey),
    headline3: GoogleFonts.openSans(
        fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.grey),
    headline4: GoogleFonts.openSans(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.grey),
    headline6: GoogleFonts.openSans(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.grey),
  );

  static ThemeData light() {
    final primaryColor = Colors.white;
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: primaryColor,
        accentColor: Colors.black,
        textSelectionTheme:
            const TextSelectionThemeData(selectionColor: Colors.black),
        textTheme: lightTextTheme,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            backgroundColor: primaryColor,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black.withOpacity(0.5),
            selectedIconTheme: IconThemeData(color: Colors.black),
            unselectedIconTheme:
                IconThemeData(color: Colors.black.withOpacity(0.4)),
            showUnselectedLabels: false),
        iconTheme: IconThemeData(color: Colors.black, opacity: 0.8));
  }

  static ThemeData dark() {
    final primaryColor = Colors.grey[900];
    return ThemeData(
        brightness: Brightness.dark,
        primaryColor: primaryColor,
        accentColor: Colors.white,
        textTheme: darkTextTheme,
        scaffoldBackgroundColor: primaryColor,
        colorScheme: ColorScheme.dark(),
        textSelectionTheme:
            const TextSelectionThemeData(selectionColor: Colors.white),
        iconTheme: IconThemeData(color: Colors.white, opacity: 0.8),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            backgroundColor: primaryColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedIconTheme: IconThemeData(color: Colors.white),
            unselectedIconTheme:
                IconThemeData(color: Colors.white.withOpacity(0.4)),
            showUnselectedLabels: false));
  }
}
