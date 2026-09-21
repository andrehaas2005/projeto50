import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Tokens de marca do Projeto 50 (asserts/Projeto 50.png):
/// azul #00A8FF, cinzas #5A5A5A / quase-preto, Bebas Neue + Montserrat.
/// Espelha os tokens usados em arquitetura-projeto50.html.
class AppColors extends ThemeExtension<AppColors> {
  final Color bg;
  final Color surface;
  final Color surface2;
  final Color surface3;
  final Color border;
  final Color text;
  final Color textMuted;
  final Color textFaint;
  final Color accent;
  final Color accentSoft;
  final Color good;
  final Color warn;
  final Color bad;

  const AppColors({
    required this.bg,
    required this.surface,
    required this.surface2,
    required this.surface3,
    required this.border,
    required this.text,
    required this.textMuted,
    required this.textFaint,
    required this.accent,
    required this.accentSoft,
    required this.good,
    required this.warn,
    required this.bad,
  });

  @override
  AppColors copyWith() => this;

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) => this;

  static const light = AppColors(
    bg: Color(0xFFF2F3F4),
    surface: Color(0xFFFFFFFF),
    surface2: Color(0xFFE9EAEB),
    surface3: Color(0xFFDADCDE),
    border: Color(0xFFD0D2D4),
    text: Color(0xFF17181A),
    textMuted: Color(0xFF5A5A5A),
    textFaint: Color(0xFF8B8D8F),
    accent: Color(0xFF0089D6),
    accentSoft: Color(0xFFE2F1FC),
    good: Color(0xFF1E7A4C),
    warn: Color(0xFFB4692A),
    bad: Color(0xFFB23A2C),
  );

  static const dark = AppColors(
    bg: Color(0xFF0A0B0D),
    surface: Color(0xFF121315),
    surface2: Color(0xFF1A1B1E),
    surface3: Color(0xFF242628),
    border: Color(0xFF28292C),
    text: Color(0xFFECEDEE),
    textMuted: Color(0xFF9A9C9E),
    textFaint: Color(0xFF616367),
    accent: Color(0xFF00A8FF),
    accentSoft: Color(0xFF132B3D),
    good: Color(0xFF3FBE85),
    warn: Color(0xFFE0A458),
    bad: Color(0xFFE5695C),
  );
}

class AppTheme {
  static TextStyle display(Color color) =>
      GoogleFonts.bebasNeue(color: color, letterSpacing: 0.4);
  static TextStyle mono(Color color) => GoogleFonts.ibmPlexMono(color: color);

  static ThemeData _build(AppColors c, Brightness brightness) {
    final body = GoogleFonts.montserratTextTheme();
    return ThemeData(
      brightness: brightness,
      scaffoldBackgroundColor: c.bg,
      canvasColor: c.bg,
      primaryColor: c.accent,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: c.accent,
        onPrimary: Colors.white,
        secondary: c.accent,
        onSecondary: Colors.white,
        error: c.bad,
        onError: Colors.white,
        surface: c.surface,
        onSurface: c.text,
      ),
      textTheme: body.apply(bodyColor: c.text, displayColor: c.text),
      fontFamily: GoogleFonts.montserrat().fontFamily,
      appBarTheme: AppBarTheme(
        backgroundColor: c.bg,
        foregroundColor: c.text,
        elevation: 0,
        titleTextStyle: display(c.text).copyWith(fontSize: 22),
      ),
      cardTheme: CardThemeData(
        color: c.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: c.border),
        ),
      ),
      dividerColor: c.border,
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: c.surface,
        indicatorColor: c.accentSoft,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return GoogleFonts.ibmPlexMono(
            fontSize: 10.5,
            color: selected ? c.accent : c.textFaint,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(color: selected ? c.accent : c.textFaint);
        }),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: c.accent,
          foregroundColor: Colors.white,
          textStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.surface2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: c.border),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
      extensions: [c],
    );
  }

  static ThemeData get lightTheme => _build(AppColors.light, Brightness.light);
  static ThemeData get darkTheme => _build(AppColors.dark, Brightness.dark);
}

extension BuildContextColors on BuildContext {
  AppColors get colors =>
      Theme.of(this).extension<AppColors>() ?? AppColors.light;
}
