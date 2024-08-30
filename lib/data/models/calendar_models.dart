class CalendarDay {
  final DateTime date;
  final bool isActiveMonth;
  final bool isActiveDate;

  const CalendarDay({
    required this.date,
    required this.isActiveMonth,
    required this.isActiveDate,
  });
}
