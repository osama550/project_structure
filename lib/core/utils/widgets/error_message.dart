import 'package:flutter/material.dart';

errorMessage(BuildContext context, {required String errorMessage}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.error,
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
                  errorMessage,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.red,
    elevation: 3,
  ));
}
