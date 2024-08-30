import 'package:flutter/material.dart';
import 'package:udevs_todo/data/models/calendar_models.dart';
import 'package:udevs_todo/domain/entities/extensions/time_ext.dart';

class MonthDate {
  final int year;
  final int month;

  int get daysInMonth => DateUtils.getDaysInMonth(year, month);

  int get firstDayOfWeekIndex => 0;

  int get weeksCount => ((daysInMonth + firstDayOffset) / 7).ceil();

  const MonthDate({
    required this.year,
    required this.month,
  });

  int get firstDayOffset {
    final int weekdayFromMonday = DateTime(year, month).weekday - 1;
    final result = (weekdayFromMonday - ((firstDayOfWeekIndex - 1) % 7)) % 7 - 1;
    return result == -1 ? 6 : result;
  }

  List<List<CalendarDay>> get weeks {
    final res = <List<CalendarDay>>[];
    var firstDayMonth = DateTime(year, month, 1);
    var firstDayOfWeek = firstDayMonth.subtract(Duration(days: firstDayOffset));

    for (var w = 0; w < weeksCount; w++) {
      final week = List<CalendarDay>.generate(
        7,
        (index) {
          final date = firstDayOfWeek.add(Duration(days: index));

          final isActiveMonth = date.year == year && date.month == month;

          return CalendarDay(
            date: date,
            isActiveMonth: isActiveMonth,
            isActiveDate: date.isToday,
          );
        },
      );
      res.add(week);
      firstDayOfWeek = firstDayOfWeek.add(const Duration(days: 7));
    }
    return res;
  }
}
