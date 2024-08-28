import 'package:flutter/material.dart';

import 'app_fonts.dart';

class TextStyles {
  // Headline styles
  static const TextStyle headline1 = TextStyle(
    fontFamily: AppFonts.urbanist,
    fontWeight: FontWeight.bold,
    fontSize: 32,
  );

  static const TextStyle headline2 = TextStyle(
    fontFamily: AppFonts.urbanist,
    fontWeight: FontWeight.bold,
    fontSize: 28,
  );

  // Subtitle styles
  static const TextStyle subtitle1 = TextStyle(
    fontFamily: AppFonts.urbanist,
    fontWeight: FontWeight.w600, // SemiBold
    fontSize: 18,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontFamily: AppFonts.urbanist,
    fontWeight: FontWeight.w500, // Medium
    fontSize: 16,
  );

  // Body text styles
  static const TextStyle bodyText1 = TextStyle(
    fontFamily: AppFonts.urbanist,
    fontWeight: FontWeight.w400, // Regular
    fontSize: 16,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontFamily: AppFonts.urbanist,
    fontWeight: FontWeight.w400, // Regular
    fontSize: 14,
  );

  // Button text styles
  static const TextStyle button = TextStyle(
    fontFamily: AppFonts.urbanist,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 1.25,
  );

  // Caption text styles
  static const TextStyle caption = TextStyle(
    fontFamily: AppFonts.urbanist,
    fontWeight: FontWeight.w400, // Regular
    fontSize: 12,
  );

  // Overline text styles
  static const TextStyle overline = TextStyle(
    fontFamily: AppFonts.urbanist,
    fontWeight: FontWeight.w400, // Regular
    fontSize: 10,
    letterSpacing: 1.5,
  );
}
