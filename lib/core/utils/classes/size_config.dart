import 'package:flutter/material.dart';

class SizeConfig {
  static const double mobile = 400;
  static const double tablet = 600;
  static const double mobileMaxWidth = 768; // Smallest iPad width (iPad Mini)

  static late double width, height;

  static void init(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;
  }
}
