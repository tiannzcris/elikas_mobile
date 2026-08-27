import 'package:flutter/material.dart';

/// Brand palette pulled from the E-LIKAS logo -- deep navy (mountain/badge),
/// red (marker/wordmark accent), green (shield/safety). Used as the single
/// source of truth so screens stop hardcoding one-off Colors.blue/grey
/// values that drift from the actual brand.
class AppColors {
  static const navy = Color(0xFF0D2A5C);
  static const navyDark = Color(0xFF071B3F);
  static const navyDarker = Color(0xFF050B18);
  static const red = Color(0xFFDC2626);
  static const green = Color(0xFF1E9E5A);
  static const surfaceMuted = Color(0xFFF4F6FA);
}

ThemeData buildAppTheme() {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.navy,
    brightness: Brightness.light,
  ).copyWith(
    primary: AppColors.navy,
    secondary: AppColors.red,
    tertiary: AppColors.green,
  );

  final radius = BorderRadius.circular(16);
  final fieldRadius = BorderRadius.circular(14);

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColors.surfaceMuted,
    splashFactory: InkSparkle.splashFactory,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.navy,
      elevation: 0,
      scrolledUnderElevation: 1,
      surfaceTintColor: Colors.white,
      centerTitle: false,
      titleTextStyle: TextStyle(color: AppColors.navy, fontSize: 19, fontWeight: FontWeight.w700),
      iconTheme: IconThemeData(color: AppColors.navy),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 3,
      shadowColor: Colors.black.withValues(alpha: 0.08),
      indicatorColor: AppColors.navy.withValues(alpha: 0.10),
      indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return TextStyle(
          fontSize: 11.5,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          color: selected ? AppColors.navy : Colors.grey.shade600,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final selected = states.contains(WidgetState.selected);
        return IconThemeData(color: selected ? AppColors.navy : Colors.grey.shade500);
      }),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: radius, side: BorderSide(color: Colors.grey.shade200)),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.navy,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: fieldRadius),
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.navy,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: fieldRadius),
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.navy,
        side: BorderSide(color: AppColors.navy.withValues(alpha: 0.35)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        shape: RoundedRectangleBorder(borderRadius: fieldRadius),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.navy,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade50,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(borderRadius: fieldRadius, borderSide: BorderSide(color: Colors.grey.shade300)),
      enabledBorder: OutlineInputBorder(borderRadius: fieldRadius, borderSide: BorderSide(color: Colors.grey.shade300)),
      focusedBorder: OutlineInputBorder(borderRadius: fieldRadius, borderSide: const BorderSide(color: AppColors.navy, width: 1.6)),
      errorBorder: OutlineInputBorder(borderRadius: fieldRadius, borderSide: BorderSide(color: colorScheme.error)),
      labelStyle: TextStyle(color: Colors.grey.shade700),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.grey.shade100,
      selectedColor: AppColors.navy.withValues(alpha: 0.12),
      side: BorderSide(color: Colors.grey.shade300),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      labelStyle: const TextStyle(fontSize: 12),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    ),
    dividerTheme: DividerThemeData(color: Colors.grey.shade200, space: 1, thickness: 1),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.navy,
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    dialogTheme: DialogThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: AppColors.navyDark,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: AppColors.navy),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected) ? AppColors.navy : null,
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected) ? AppColors.navy.withValues(alpha: 0.5) : null,
      ),
    ),
  );
}
