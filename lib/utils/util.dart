import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(
    BuildContext context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme =
      GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme =
      GoogleFonts.getTextTheme(displayFontString, baseTextTheme);

  TextTheme lightTextTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge!.copyWith(color: Colors.white),
    bodyMedium: bodyTextTheme.bodyMedium!.copyWith(color: Colors.white),
    bodySmall: bodyTextTheme.bodySmall!.copyWith(color: Colors.white),
    labelLarge: bodyTextTheme.labelLarge!.copyWith(color: Colors.white),
    labelMedium: bodyTextTheme.labelMedium!.copyWith(color: Colors.white),
    labelSmall: bodyTextTheme.labelSmall!.copyWith(color: Colors.white),
  );

  TextTheme darkTextTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge?.copyWith(color: Colors.white),
    bodyMedium: bodyTextTheme.bodyMedium?.copyWith(color: Colors.white),
    bodySmall: bodyTextTheme.bodySmall?.copyWith(color: Colors.white),
    labelLarge: bodyTextTheme.labelLarge?.copyWith(color: Colors.white),
    labelMedium: bodyTextTheme.labelMedium?.copyWith(color: Colors.white),
    labelSmall: bodyTextTheme.labelSmall?.copyWith(color: Colors.white),
  );

  // Get current brightness
  Brightness brightness = Theme.of(context).brightness;

  // Return appropriate text theme based on brightness
  return brightness == Brightness.light ? lightTextTheme : darkTextTheme;
}

TextTheme createLightTextTheme(
    BuildContext context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme =
      GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme =
      GoogleFonts.getTextTheme(displayFontString, baseTextTheme);

  return displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
}

TextTheme createDarkTextTheme(
    BuildContext context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme =
      GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme =
      GoogleFonts.getTextTheme(displayFontString, baseTextTheme);

  return displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge?.copyWith(color: Colors.white),
    bodyMedium: bodyTextTheme.bodyMedium?.copyWith(color: Colors.white),
    bodySmall: bodyTextTheme.bodySmall?.copyWith(color: Colors.white),
    labelLarge: bodyTextTheme.labelLarge?.copyWith(color: Colors.grey[300]),
    labelMedium: bodyTextTheme.labelMedium?.copyWith(color: Colors.grey[300]),
    labelSmall: bodyTextTheme.labelSmall?.copyWith(color: Colors.grey[300]),
  );
}
