import 'package:flutter/material.dart';
import 'package:project_structure/core/theme/color.dart';

class LoadingStateView extends StatelessWidget {
  const LoadingStateView({
    super.key,
    this.color = ColorsPalette.primary500,
  });
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: color,
    ));
  }
}
