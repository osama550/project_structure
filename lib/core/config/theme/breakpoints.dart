import 'package:flutter/material.dart';

@immutable
class Breakpoints {
  static const double mobile = 400;
  static const double tablet = 600;
  static const double desktop = 1000;

  static DeviceType of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width < mobile) return DeviceType.mobile;
    if (width < tablet) return DeviceType.tablet;
    if (width < desktop) return DeviceType.desktop;

    return DeviceType.mobile;
  }
}

enum DeviceType { mobile, tablet, desktop }
