import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  return ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.openSansTextTheme(),
      visualDensity: VisualDensity.comfortable,
      indicatorColor: Colors.black,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.black,
        onPrimary: Colors.white,
        primaryContainer: Colors.black,
        onPrimaryContainer: Colors.white,
        secondary: Colors.black,
        onSecondary: Colors.white,
        secondaryContainer: Colors.white,
        onSecondaryContainer: Colors.black,
        background: Colors.white,
        onBackground: Colors.black,
        surface: Colors.white,
        onSurface: Colors.black,
        surfaceTint: Colors.black,
        tertiary: Colors.black,
        onTertiary: Colors.white,
        tertiaryContainer: Colors.black,
        onTertiaryContainer: Colors.black,
        surfaceVariant: Colors.black,
        onSurfaceVariant: Colors.black,
        outlineVariant: Colors.white,
        onInverseSurface: Colors.white,
        inverseSurface: Colors.black,
        inversePrimary: Colors.black,
        error: Color(0xFFBA1A1A),
        errorContainer: Color(0xFFFFDAD6),
        onError: Colors.white,
        onErrorContainer: Color(0xFF410002),
      ),
      appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.black,
        cursorColor: Colors.black,
        selectionHandleColor: Colors.black,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      dialogTheme: const DialogTheme(
        surfaceTintColor: Colors.white,
      ),
      cardTheme: const CardTheme(
        surfaceTintColor: Colors.white,
      ),
      popupMenuTheme: const PopupMenuThemeData(
        surfaceTintColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        enableFeedback: false,
      ));
}
