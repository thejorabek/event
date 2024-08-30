import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:udevs_todo/domain/entities/extensions/date_ext.dart';

class AppDateTimePicker extends StatelessWidget {
  final TimeOfDay startTime;
  final TimeOfDay finishTime;
  final void Function(TimeOfDay time) startComplete;
  final void Function(TimeOfDay time) finishComplete;

  const AppDateTimePicker({
    super.key,
    required this.startTime,
    required this.finishTime,
    required this.startComplete,
    required this.finishComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CupertinoButton(
          onPressed: () => getTime(context, startTime, 1),
          child: Container(
            width: 80,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              startTime.toHM(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        const Text('to'),
        CupertinoButton(
          onPressed: () => getTime(context, finishTime, 2),
          child: Container(
            width: 80,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              finishTime.toHM(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  void getTime(BuildContext context, TimeOfDay timeOfDay, int index) async {
    final time = await showTimePicker(context: context, initialTime: timeOfDay);
    if (time != null) {
      if (index == 1) {
        startComplete(time);
      } else {
        finishComplete(time);
      }
    }
  }
}
