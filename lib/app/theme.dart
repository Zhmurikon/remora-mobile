import 'package:flutter/material.dart';

/// Дизайн-токены Remora, зеркало tokens.css из packages/ui.
/// Произвольные hex запрещены — только через эти константы.
class RemoraColors {
  const RemoraColors._();

  // --- Светлая тема ---
  static const Color lightBg = Color(0xFFFAFAF9);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceMuted = Color(0xFFF5F5F4);
  static const Color lightBorder = Color(0xFFE7E5E4);
  static const Color lightFg = Color(0xFF1C1917);
  static const Color lightFgMuted = Color(0xFF57534E);
  static const Color lightFgSubtle = Color(0xFF8A8580);
  static const Color lightPrimary = Color(0xFF0D8285);
  static const Color lightPrimaryHover = Color(0xFF0A696C);
  static const Color lightPrimaryFg = Color(0xFFFFFFFF);
  static const Color lightPrimarySubtle = Color(0xFFE0F4F4);
  static const Color lightAccent = Color(0xFFEA8D2F);
  static const Color lightAccentFg = Color(0xFFFFFFFF);
  static const Color lightAccentSubtle = Color(0xFFFDF0E0);
  static const Color lightSuccess = Color(0xFF168F60);
  static const Color lightSuccessSubtle = Color(0xFFDCF4E9);
  static const Color lightWarning = Color(0xFFCA8A04);
  static const Color lightWarningSubtle = Color(0xFFFEF3C7);
  static const Color lightDanger = Color(0xFFD03D3D);
  static const Color lightDangerSubtle = Color(0xFFFDE4E4);

  // --- Тёмная тема ---
  static const Color darkBg = Color(0xFF141416);
  static const Color darkSurface = Color(0xFF1E1E21);
  static const Color darkSurfaceMuted = Color(0xFF28282C);
  static const Color darkBorder = Color(0xFF38383D);
  static const Color darkFg = Color(0xFFF5F5F4);
  static const Color darkFgMuted = Color(0xFFB4B1AD);
  static const Color darkFgSubtle = Color(0xFF84817D);
  static const Color darkPrimary = Color(0xFF2DB2B4);
  static const Color darkPrimaryHover = Color(0xFF42C7C9);
  static const Color darkPrimaryFg = Color(0xFF0C1E1F);
  static const Color darkPrimarySubtle = Color(0xFF143C3D);
  static const Color darkAccent = Color(0xFFF0A04E);
  static const Color darkAccentFg = Color(0xFF281808);
  static const Color darkAccentSubtle = Color(0xFF3E2C18);
  static const Color darkSuccess = Color(0xFF34B27E);
  static const Color darkSuccessSubtle = Color(0xFF143A2C);
  static const Color darkWarning = Color(0xFFE0A82A);
  static const Color darkWarningSubtle = Color(0xFF3E3210);
  static const Color darkDanger = Color(0xFFE86060);
  static const Color darkDangerSubtle = Color(0xFF441C1C);
}

/// Светлая тема Remora.
ThemeData remoraLightTheme() {
  final colorScheme = ColorScheme.light(
    primary: RemoraColors.lightPrimary,
    onPrimary: RemoraColors.lightPrimaryFg,
    secondary: RemoraColors.lightAccent,
    onSecondary: RemoraColors.lightAccentFg,
    error: RemoraColors.lightDanger,
    surface: RemoraColors.lightSurface,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: RemoraColors.lightBg,
    appBarTheme: const AppBarTheme(
      backgroundColor: RemoraColors.lightSurface,
      foregroundColor: RemoraColors.lightFg,
      elevation: 0,
      scrolledUnderElevation: 1,
    ),
    cardTheme: CardThemeData(
      color: RemoraColors.lightSurface,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: RemoraColors.lightBorder),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: RemoraColors.lightPrimary,
        foregroundColor: RemoraColors.lightPrimaryFg,
        minimumSize: const Size(44, 44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: RemoraColors.lightPrimary,
        minimumSize: const Size(44, 44),
        side: const BorderSide(color: RemoraColors.lightBorder),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: RemoraColors.lightFg,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: RemoraColors.lightFg,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: RemoraColors.lightFg,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: RemoraColors.lightFgMuted,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    dividerColor: RemoraColors.lightBorder,
    focusColor: RemoraColors.lightPrimary.withValues(alpha: 0.12),
  );
}

/// Тёмная тема Remora.
ThemeData remoraDarkTheme() {
  final colorScheme = ColorScheme.dark(
    primary: RemoraColors.darkPrimary,
    onPrimary: RemoraColors.darkPrimaryFg,
    secondary: RemoraColors.darkAccent,
    onSecondary: RemoraColors.darkAccentFg,
    error: RemoraColors.darkDanger,
    surface: RemoraColors.darkSurface,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: RemoraColors.darkBg,
    appBarTheme: const AppBarTheme(
      backgroundColor: RemoraColors.darkSurface,
      foregroundColor: RemoraColors.darkFg,
      elevation: 0,
      scrolledUnderElevation: 1,
    ),
    cardTheme: CardThemeData(
      color: RemoraColors.darkSurface,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: RemoraColors.darkBorder),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: RemoraColors.darkPrimary,
        foregroundColor: RemoraColors.darkPrimaryFg,
        minimumSize: const Size(44, 44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: RemoraColors.darkPrimary,
        minimumSize: const Size(44, 44),
        side: const BorderSide(color: RemoraColors.darkBorder),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: RemoraColors.darkFg,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: RemoraColors.darkFg,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: RemoraColors.darkFg,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: RemoraColors.darkFgMuted,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    dividerColor: RemoraColors.darkBorder,
    focusColor: RemoraColors.darkPrimary.withValues(alpha: 0.12),
  );
}
