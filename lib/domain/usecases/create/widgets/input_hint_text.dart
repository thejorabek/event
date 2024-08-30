import 'package:flutter/material.dart';
import 'package:udevs_todo/core/constants/colors/colors.dart';

class InputHintText extends StatelessWidget {
  const InputHintText({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.grey900,
        letterSpacing: 0.25,
      ),
    );
  }
}
