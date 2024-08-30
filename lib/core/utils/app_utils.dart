import 'package:flutter/material.dart';

class AppUtils {
  const AppUtils._();
  static ScaffoldFeatureController msg(BuildContext context, String message,
      {Color color = const Color.fromARGB(255, 10, 223, 17)}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}