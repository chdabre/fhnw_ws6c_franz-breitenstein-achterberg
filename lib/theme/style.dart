import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// defines main colors
abstract class ThemeColors {
  // Main Colors
  static const Color mustard = Color(0xFFF2C94C);

  // Text Colors
  static const Color textBlackHighEmphasis = Color.fromRGBO(0, 0, 0, 0.87);
  static const Color textBlackMediumEmphasis = Color.fromRGBO(0, 0, 0, 0.6);

  static const Color background = Color(0xFFFFFFFF);
}

/// builds the main text theme
TextTheme _buildDefaultTextTheme(TextTheme base) {
  return base.copyWith(
    headline4: GoogleFonts.playfairDisplay(
      fontSize: 24,
      height: 1.5,
      fontWeight: FontWeight.w900,
      color: ThemeColors.textBlackHighEmphasis,
    ),
    headline5: GoogleFonts.playfairDisplay(
      fontSize: 20,
      height: 1.0,
      fontWeight: FontWeight.w900,
      color: ThemeColors.textBlackHighEmphasis,
    )
  );
}
final ThemeData theme = appTheme();

/// builds the main material theme
ThemeData appTheme() {
  final ThemeData base = ThemeData.light();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ThemeColors.background,
      systemNavigationBarColor: ThemeColors.background,
      systemNavigationBarIconBrightness: Brightness.dark,

  ));
  return base.copyWith(
    // Define the default brightness and colors
    brightness: Brightness.light,
    scaffoldBackgroundColor: ThemeColors.background,
    dialogBackgroundColor: ThemeColors.background,
    primaryColor: ThemeColors.mustard,
    accentColor: ThemeColors.mustard,
    appBarTheme: AppBarTheme(
        color: ThemeColors.background,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: ThemeColors.textBlackMediumEmphasis
        )
    ),
    // Define the default text Themes
    textTheme: _buildDefaultTextTheme(base.textTheme),
    primaryTextTheme: _buildDefaultTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildDefaultTextTheme(base.accentTextTheme),
  );
}