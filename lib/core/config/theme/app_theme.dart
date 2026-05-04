import 'package:flutter/material.dart';
import 'package:project_structure/core/config/theme/app_typography.dart';
import 'package:project_structure/core/config/theme/breakpoints.dart';

class AppTheme {
  static ThemeData? theme(DeviceType deviceType) {
    final typography = switch (deviceType) {
      DeviceType.mobile => AppTypography.mobile,
      DeviceType.tablet => AppTypography.tablet,
      DeviceType.desktop => AppTypography.desktop,
    };
    return ThemeData(
      extensions: [typography],
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xff1E1E1E),
      ),
      iconTheme: const IconThemeData(color: Colors.green),
      dialogTheme: DialogThemeData(
          backgroundColor: const Color(0xff282A2C),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      appBarTheme: AppBarTheme(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          titleTextStyle: typography.h5Bold,
          centerTitle: true),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        disabledBackgroundColor: const Color(0xff282A2C),
        disabledForegroundColor: Colors.white10,
        fixedSize: const Size(double.maxFinite, 50),
        shadowColor: Colors.green,
        elevation: 4,
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      )),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(textStyle: typography.bodySmallBold)),
      hintColor: const Color(0xff838383),
      primaryColor: Colors.green,
      cardColor: const Color(0xff282A2C),
      scaffoldBackgroundColor: const Color(0xff1E1E1E),
      dividerColor: Colors.grey[900],
      shadowColor: Colors.black,
      highlightColor: const Color(0xffF5F5F5),
      textTheme: textTheme(typography),
    );
  }

  static TextTheme textTheme(AppTypography typography) {
    return TextTheme(
      displayLarge: typography.h1Bold,
      displayMedium: typography.h2Bold,
      displaySmall: typography.h3Bold,
      headlineLarge: typography.h4Bold,
      headlineMedium: typography.h5Bold,
      headlineSmall: typography.h6Bold,
      titleLarge: typography.bodyXLargeBold,
      titleMedium: typography.bodyXLargeSemiBold,
      titleSmall: typography.bodyLargeBold,
      bodyLarge: typography.bodyLargeMedium,
      bodyMedium: typography.bodyMediumBold,
      bodySmall: typography.bodySmallBold,
      labelLarge: typography.bodyXSmallBold,
      labelMedium: typography.bodyXSmallMedium,
      labelSmall: typography.bodyXSmallRegular,
    );
  }
}
