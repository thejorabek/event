import 'package:flutter/material.dart';
import 'package:udevs_todo/core/constants/colors/colors.dart';
import 'package:udevs_todo/core/constants/device_frame.dart';
import 'package:udevs_todo/core/constants/text_styles.dart';

class ViewTodoBody extends StatelessWidget {
  const ViewTodoBody({
    super.key,
    required this.reminder,
    required this.description,
  });

  final String reminder;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Reminder",
            style: Styles.poppins600.copyWith(
              fontSize: 18,
              color: AppColors.black,
            ),
          ),
          FixSize.sized(context, height: 0.02),
          Text(
            reminder,
            style: Styles.poppins500.copyWith(
              fontSize: 14,
              color: AppColors.grey600,
            ),
          ),
          FixSize.sized(context, height: 0.03),
          Text(
            "Description",
            style: Styles.poppins600.copyWith(
              fontSize: 18,
              color: AppColors.black,
            ),
          ),
          FixSize.sized(context, height: 0.02),
          SingleChildScrollView(
            child: Text(
              description,
              style: Styles.poppins500.copyWith(
                fontSize: 12,
                color: AppColors.grey700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
