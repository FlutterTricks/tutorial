import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upi_quick_qr/core/theme/app_theme.dart';

class AppTheme {
  static ThemeData getTheme(
    BuildContext context,
    ColorScheme colorScheme,
    SystemUiOverlayStyle systemUiOverlayStyle,
  ) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: colorScheme.brightness,
      textTheme: textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      // scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      // textTheme: textTheme,
      appBarTheme: appBarTheme(systemUiOverlayStyle),
      applyElevationOverlayColor: true,
      inputDecorationTheme: inputDecorationTheme,
      elevatedButtonTheme: elevatedButtonTheme(
        context,
        colorScheme,
      ),
      outlinedButtonTheme: outlineButtonTheme(
        context,
        colorScheme,
      ),
      segmentedButtonTheme: segmentedButtonTheme(
        context,
        colorScheme,
      ),
    );
  }
}
