import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.openSansTextTheme(),
    visualDensity: VisualDensity.comfortable,
    primaryColor: Colors.blue,
  );
}
