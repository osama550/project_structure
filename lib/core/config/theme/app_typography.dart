import 'package:flutter/material.dart';

@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  const AppTypography({
    required this.bodyMediumMedium,
    required this.bodyLargeSemiBold,
    required this.bodyLargeBold,
    required this.h6Bold,
    required this.bodyMediumSemiBold,
    required this.bodyXSmallMedium,
    required this.bodyXSmallRegular,
    required this.bodyMediumBold,
    required this.h4Bold,
    required this.bodyMediumRegular,
    required this.bodySmallMedium,
    required this.bodySmallBold,
    required this.bodyXLargeSemiBold,
    required this.h5Bold,
    required this.bodyLargeMedium,
    required this.bodyLargeRegular,
    required this.bodyXLargeMedium,
    required this.bodyXSmallBold,
    required this.h3Bold,
    required this.h1Bold,
    required this.bodyXSmallSemiBold,
    required this.h2Bold,
    required this.bodyXLargeBold,
  });

  final TextStyle bodyMediumMedium;
  final TextStyle bodyLargeSemiBold;
  final TextStyle bodyLargeBold;
  final TextStyle h6Bold;
  final TextStyle bodyMediumSemiBold;
  final TextStyle bodyXSmallMedium;
  final TextStyle bodyXSmallRegular;
  final TextStyle bodyMediumBold;
  final TextStyle h4Bold;
  final TextStyle bodyMediumRegular;
  final TextStyle bodySmallMedium;
  final TextStyle bodySmallBold;
  final TextStyle bodyXLargeSemiBold;
  final TextStyle h5Bold;
  final TextStyle bodyLargeMedium;
  final TextStyle bodyLargeRegular;
  final TextStyle bodyXLargeMedium;
  final TextStyle bodyXSmallBold;
  final TextStyle h3Bold;
  final TextStyle h1Bold;
  final TextStyle bodyXSmallSemiBold;
  final TextStyle h2Bold;
  final TextStyle bodyXLargeBold;

  static const mobile = AppTypography(
    bodyMediumMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    bodyLargeSemiBold: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    bodyLargeBold: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    h6Bold: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    bodyMediumSemiBold: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    bodyXSmallMedium: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
    bodyMediumBold: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
    h4Bold: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    bodyMediumRegular: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    bodySmallMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    bodyXSmallRegular: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
    bodySmallBold: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
    bodyXLargeSemiBold: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    h5Bold: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    bodyLargeMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    bodyLargeRegular: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    bodyXLargeMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    bodyXSmallBold: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
    h3Bold: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
    h1Bold: TextStyle(fontSize: 48, fontWeight: FontWeight.w700),
    bodyXSmallSemiBold: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
    h2Bold: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
    bodyXLargeBold: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
  );

  static const tablet = AppTypography(
    bodyMediumMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    bodyLargeSemiBold: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    bodyLargeBold: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    h6Bold: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
    bodyMediumSemiBold: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    bodyXSmallMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    bodyMediumBold: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    h4Bold: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
    bodyMediumRegular: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
    bodySmallMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    bodyXSmallRegular: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    bodySmallBold: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    bodyXLargeSemiBold: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    h5Bold: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    bodyLargeMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    bodyLargeRegular: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    bodyXLargeMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
    bodyXSmallBold: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
    h3Bold: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
    h1Bold: TextStyle(fontSize: 52, fontWeight: FontWeight.w700),
    bodyXSmallSemiBold: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    h2Bold: TextStyle(fontSize: 44, fontWeight: FontWeight.w700),
    bodyXLargeBold: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
  );

  static const desktop = AppTypography(
    bodyMediumMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    bodyLargeSemiBold: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    bodyLargeBold: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    h6Bold: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
    bodyMediumSemiBold: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    bodyXSmallMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
    bodyMediumBold: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    h4Bold: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
    bodyMediumRegular: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
    bodySmallMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    bodyXSmallRegular: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    bodySmallBold: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    bodyXLargeSemiBold: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    h5Bold: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    bodyLargeMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    bodyLargeRegular: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
    bodyXLargeMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
    bodyXSmallBold: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
    h3Bold: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
    h1Bold: TextStyle(fontSize: 52, fontWeight: FontWeight.w700),
    bodyXSmallSemiBold: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    h2Bold: TextStyle(fontSize: 44, fontWeight: FontWeight.w700),
    bodyXLargeBold: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
  );

  @override
  AppTypography copyWith({
    TextStyle? bodyMediumMedium,
    TextStyle? bodyLargeSemiBold,
    TextStyle? bodyLargeBold,
    TextStyle? h6Bold,
    TextStyle? bodyMediumSemiBold,
    TextStyle? bodyXSmallMedium,
    TextStyle? bodyMediumBold,
    TextStyle? h4Bold,
    TextStyle? bodyMediumRegular,
    TextStyle? bodySmallMedium,
    TextStyle? bodyXSmallRegular,
    TextStyle? bodySmallBold,
    TextStyle? bodyXLargeSemiBold,
    TextStyle? h5Bold,
    TextStyle? bodyLargeMedium,
    TextStyle? bodyLargeRegular,
    TextStyle? bodyXLargeMedium,
    TextStyle? bodyXSmallBold,
    TextStyle? h3Bold,
    TextStyle? h1Bold,
    TextStyle? bodyXSmallSemiBold,
    TextStyle? h2Bold,
    TextStyle? bodyXLargeBold,
  }) {
    return AppTypography(
      bodyMediumMedium: bodyMediumMedium ?? this.bodyMediumMedium,
      bodyLargeSemiBold: bodyLargeSemiBold ?? this.bodyLargeSemiBold,
      bodyLargeBold: bodyLargeBold ?? this.bodyLargeBold,
      h6Bold: h6Bold ?? this.h6Bold,
      bodyMediumSemiBold: bodyMediumSemiBold ?? this.bodyMediumSemiBold,
      bodyXSmallMedium: bodyXSmallMedium ?? this.bodyXSmallMedium,
      bodyMediumBold: bodyMediumBold ?? this.bodyMediumBold,
      h4Bold: h4Bold ?? this.h4Bold,
      bodyMediumRegular: bodyMediumRegular ?? this.bodyMediumRegular,
      bodySmallMedium: bodySmallMedium ?? this.bodySmallMedium,
      bodyXSmallRegular: bodyXSmallRegular ?? this.bodyXSmallRegular,
      bodySmallBold: bodySmallBold ?? this.bodySmallBold,
      bodyXLargeSemiBold: bodyXLargeSemiBold ?? this.bodyXLargeSemiBold,
      h5Bold: h5Bold ?? this.h5Bold,
      bodyLargeMedium: bodyLargeMedium ?? this.bodyLargeMedium,
      bodyLargeRegular: bodyLargeRegular ?? this.bodyLargeRegular,
      bodyXLargeMedium: bodyXLargeMedium ?? this.bodyXLargeMedium,
      bodyXSmallBold: bodyXSmallBold ?? this.bodyXSmallBold,
      h3Bold: h3Bold ?? this.h3Bold,
      h1Bold: h1Bold ?? this.h1Bold,
      bodyXSmallSemiBold: bodyXSmallSemiBold ?? this.bodyXSmallSemiBold,
      h2Bold: h2Bold ?? this.h2Bold,
      bodyXLargeBold: bodyXLargeBold ?? this.bodyXLargeBold,
    );
  }

  @override
  AppTypography lerp(ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) return this;
    return AppTypography(
      bodyMediumMedium:
          TextStyle.lerp(bodyMediumMedium, other.bodyMediumMedium, t)!,
      bodyLargeSemiBold:
          TextStyle.lerp(bodyLargeSemiBold, other.bodyLargeSemiBold, t)!,
      bodyLargeBold: TextStyle.lerp(bodyLargeBold, other.bodyLargeBold, t)!,
      h6Bold: TextStyle.lerp(h6Bold, other.h6Bold, t)!,
      bodyMediumSemiBold:
          TextStyle.lerp(bodyMediumSemiBold, other.bodyMediumSemiBold, t)!,
      bodyXSmallMedium:
          TextStyle.lerp(bodyXSmallMedium, other.bodyXSmallMedium, t)!,
      bodyXSmallRegular:
          TextStyle.lerp(bodyXSmallRegular, other.bodyXSmallRegular, t)!,
      bodySmallBold: TextStyle.lerp(bodySmallBold, other.bodySmallBold, t)!,
      bodyMediumBold: TextStyle.lerp(bodyMediumBold, other.bodyMediumBold, t)!,
      h4Bold: TextStyle.lerp(h4Bold, other.h4Bold, t)!,
      bodyMediumRegular:
          TextStyle.lerp(bodyMediumRegular, other.bodyMediumRegular, t)!,
      bodySmallMedium:
          TextStyle.lerp(bodySmallMedium, other.bodySmallMedium, t)!,
      bodyXLargeSemiBold:
          TextStyle.lerp(bodyXLargeSemiBold, other.bodyXLargeSemiBold, t)!,
      h5Bold: TextStyle.lerp(h5Bold, other.h5Bold, t)!,
      bodyLargeMedium:
          TextStyle.lerp(bodyLargeMedium, other.bodyLargeMedium, t)!,
      bodyLargeRegular:
          TextStyle.lerp(bodyLargeRegular, other.bodyLargeRegular, t)!,
      bodyXLargeMedium:
          TextStyle.lerp(bodyXLargeMedium, other.bodyXLargeMedium, t)!,
      bodyXSmallBold: TextStyle.lerp(bodyXSmallBold, other.bodyXSmallBold, t)!,
      h3Bold: TextStyle.lerp(h3Bold, other.h3Bold, t)!,
      h1Bold: TextStyle.lerp(h1Bold, other.h1Bold, t)!,
      bodyXSmallSemiBold:
          TextStyle.lerp(bodyXSmallSemiBold, other.bodyXSmallSemiBold, t)!,
      h2Bold: TextStyle.lerp(h2Bold, other.h2Bold, t)!,
      bodyXLargeBold: TextStyle.lerp(bodyXLargeBold, other.bodyXLargeBold, t)!,
    );
  }
}
