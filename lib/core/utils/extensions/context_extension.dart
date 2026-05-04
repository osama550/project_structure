import 'package:flutter/material.dart';
import 'package:project_structure/core/config/theme/app_typography.dart';

extension ThemeContextExtensions on BuildContext {
  AppTypography get typography {
    return Theme.of(this).extension<AppTypography>() ?? AppTypography.mobile;
  }

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
}
