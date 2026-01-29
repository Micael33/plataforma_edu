import 'package:flutter/material.dart';

class AccessibilityTheme {
  final bool reducedMotion;
  final bool largeText;
  final bool highContrast;

  const AccessibilityTheme({this.reducedMotion = false, this.largeText = false, this.highContrast = false});
}

final ColorScheme _cs = ColorScheme.fromSeed(
  seedColor: const Color(0xFF2F80ED),
  brightness: Brightness.light,
  primary: const Color(0xFF2F80ED),
  secondary: const Color(0xFF63C6B8),
  surface: Colors.white,
  onSurface: const Color(0xFF0A2540),
  background: const Color(0xFFF6F9FF),
  error: Colors.redAccent,
);

ThemeData appTheme({bool reducedMotion = false, bool largeText = false, bool highContrast = false}) {
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: _cs,
    scaffoldBackgroundColor: _cs.background,
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontFamily: 'Inter', fontSize: largeText ? 18 : 16, height: 1.45, color: _cs.onBackground),
      bodyMedium: TextStyle(fontFamily: 'Inter', fontSize: largeText ? 16 : 14, color: _cs.onBackground),
      headlineSmall: TextStyle(fontFamily: 'Inter', fontSize: largeText ? 22 : 20, fontWeight: FontWeight.w600, color: _cs.onBackground),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _cs.primary,
        foregroundColor: _cs.onPrimary,
        minimumSize: const Size(56, 48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    pageTransitionsTheme: PageTransitionsTheme(builders: {
      TargetPlatform.android: reducedMotion ? const FadeUpwardsPageTransitionsBuilder() : const ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: reducedMotion ? const CupertinoPageTransitionsBuilder() : const CupertinoPageTransitionsBuilder(),
    }),
  );

  if (highContrast) {
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: const Color(0xFF1B4F8A),
        onBackground: Colors.black,
      ),
    );
  }

  return base;
}
