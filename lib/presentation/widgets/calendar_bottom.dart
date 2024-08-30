import 'package:flutter/material.dart';
import 'package:udevs_todo/core/constants/colors/colors.dart';
import 'package:udevs_todo/core/constants/text_styles.dart';

class CalendarBottom extends StatelessWidget {
  const CalendarBottom({
    super.key,
    required this.addEvent,
  });

  final void Function() addEvent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Schedule"),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.blue,
              minimumSize: Size(MediaQuery.sizeOf(context).height * 0.13, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: addEvent,
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  color: AppColors.white,
                  size: 15,
                ),
                Text(
                  "Add Event",
                  style: Styles.poppins600.copyWith(
                    fontSize: 12,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
