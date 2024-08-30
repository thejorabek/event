import 'package:flutter/material.dart';
import 'package:udevs_todo/core/constants/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.width = 0.0,
    this.height = 0.0,
    this.line = 1,
  });

  final double width;
  final double height;
  final TextEditingController controller;
  final int line;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null) return null;
        if (value.isEmpty) {
          return "Empty";
        } else {
          return null;
        }
      },
      controller: controller,
      maxLines: line,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey100,
        constraints: BoxConstraints(minWidth: width, minHeight: height, maxHeight: line > 2 ? double.infinity : 60),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
