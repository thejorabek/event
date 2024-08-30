import 'package:flutter/material.dart';
import 'package:udevs_todo/core/constants/colors/colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back,
        color: AppColors.grey500,
        size: 35,
      ),
    );
  }
}
