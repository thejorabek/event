import 'package:flutter/material.dart';
import 'package:udevs_todo/data/models/todo_model.dart';
import 'package:udevs_todo/domain/entities/extensions/time_ext.dart';

class CustomDate extends StatelessWidget {
  final bool isActiveMonth;
  final VoidCallback onTap;
  final bool isSelected;
  final List<TodoModel> eventModel;
  final DateTime date;
  final bool isGreyedOut;

  const CustomDate({
    Key? key,
    required this.isActiveMonth,
    required this.isSelected,
    required this.date,
    required this.onTap,
    required this.eventModel,
    required this.isGreyedOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int number = date.day;
    final isToday = date.isToday;
    return Column(
      children: [
        IconButton(
          onPressed: onTap,
          style: isSelected
              ? IconButton.styleFrom(backgroundColor: Colors.blue.shade300)
              : isToday
                  ? IconButton.styleFrom(backgroundColor: Colors.grey.shade200)
                  : null,
          icon: Text(
            number.toString(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: isActiveMonth ? Colors.black : Colors.grey),
          ),
        ),
        if (isActiveMonth)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: eventModel
                .map(
                  (event) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2.5),
                      height: 5,
                      width: 5,
                      decoration: BoxDecoration(color: Colors.primaries[event.priorityColor], shape: BoxShape.circle),
                    );
                  },
                )
                .take(3)
                .toList(),
          ),
        const SizedBox(height: 8),
      ],
    );
  }
}
