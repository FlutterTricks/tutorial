import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ElevatedButtonThemeData elevatedButtonTheme(
  BuildContext context,
  ColorScheme colorScheme,
) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
      foregroundColor: colorScheme.onPrimaryContainer,
      backgroundColor: colorScheme.primaryContainer,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.white,
      // foregroundColor: colorScheme.primary,
    ),
  );
}

OutlinedButtonThemeData outlineButtonTheme(
  BuildContext context,
  ColorScheme colorScheme,
) {
  return OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
      foregroundColor: colorScheme.onPrimaryContainer,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.white,
      // foregroundColor: colorScheme.primary,
      // backgroundColor: colorScheme.background,
      side: BorderSide(
        color: colorScheme.outline,
        width: 1,
      ),
    ),
  );
}

SegmentedButtonThemeData segmentedButtonTheme(
    BuildContext context, ColorScheme colorScheme) {
  return SegmentedButtonThemeData(
      style: SegmentedButton.styleFrom(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
    ),
  ));
}

AppBarTheme appBarTheme(SystemUiOverlayStyle systemUiOverlayStyle) {
  return AppBarTheme(
    elevation: 0,
    systemOverlayStyle: systemUiOverlayStyle.copyWith(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ),
  );
}

InputDecorationTheme get inputDecorationTheme {
  return InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
  );
}

TextTheme get textTheme {
  return const TextTheme(
    labelMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  );
}