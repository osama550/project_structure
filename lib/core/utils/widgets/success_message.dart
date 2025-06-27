import 'package:flutter/material.dart';

successMessage(BuildContext context, {required String successMessage}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.white,
            size: 40,
          ),
          const SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  successMessage,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.green,
    elevation: 3,
  ));
}
