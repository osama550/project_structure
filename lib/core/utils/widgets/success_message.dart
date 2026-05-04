import 'package:flutter/material.dart';
import 'package:project_structure/core/config/theme/color.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> successMessage(
    BuildContext context,
    {required String successMessage,
    String? subtitle}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  final snackBar = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    content: Card(
      color: ColorsPalette.success,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          children: [
            const Icon(
              Icons.check_circle,
              color: ColorsPalette.white,
              size: 24,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    successMessage,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: ColorsPalette.white,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 11,
                        color: ColorsPalette.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child:
                  const Icon(Icons.close, color: ColorsPalette.white, size: 18),
            ),
          ],
        ),
      ),
    ),
    duration: const Duration(seconds: 3),
  );
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
