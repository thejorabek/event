import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udevs_todo/data/models/custom_date_model.dart';
import 'package:udevs_todo/data/models/date_model.dart';
import 'package:udevs_todo/data/models/todo_model.dart';
import 'package:udevs_todo/domain/entities/extensions/time_ext.dart';
import '../blocs/todo_bloc/todo_bloc.dart';
import '../blocs/todo_bloc/todo_event.dart';
import '../blocs/todo_bloc/todo_state.dart';

class Calendar extends StatefulWidget {
  final List<TodoModel> todos;

  const Calendar({Key? key, required this.todos}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late DateTime selectedMonth;
  DateTime? selectedDate;
  List<TodoModel> dayEvents = [];

  void getEvents() {
    if (selectedDate != null) {
      dayEvents = widget.todos.where((element) => selectedDate!.isSameDate(element.time.startTime)).cast<TodoModel>().toList();
    }
  }

  void onChange(DateTime value) {
    setState(() {
      selectedMonth = value;
      selectedDate = null; // Reset selected date when month changes
    });
  }

  @override
  void initState() {
    selectedMonth = DateTime.now().monthStart;
    super.initState();
  }

  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  @override
  Widget build(BuildContext context) {
    var data = MonthDate(
      year: selectedMonth.year,
      month: selectedMonth.month,
    );
    return BlocBuilder<TodoBloc, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(months[selectedMonth.month - 1], style: Theme.of(context).textTheme.titleMedium),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () => onChange(selectedMonth.addMonth(-1)),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.grey.withOpacity(0.1),
                          ),
                          icon: const Icon(CupertinoIcons.chevron_left, size: 18),
                        ),
                        IconButton(
                          onPressed: () => onChange(selectedMonth.addMonth(1)),
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.grey.withOpacity(0.1),
                          ),
                          icon: const Icon(CupertinoIcons.chevron_right, size: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Table(
                children: [
                  const TableRow(children: [
                    Text("Mon", textAlign: TextAlign.center),
                    Text("Tue", textAlign: TextAlign.center),
                    Text("Wed", textAlign: TextAlign.center),
                    Text("Thu", textAlign: TextAlign.center),
                    Text("Fri", textAlign: TextAlign.center),
                    Text("Sat", textAlign: TextAlign.center),
                    Text("Sun", textAlign: TextAlign.center),
                  ]),
                  for (var week in data.weeks)
                    TableRow(
                      children: week.map(
                        (d) {
                          return CustomDate(
                            eventModel: widget.todos.where((element) => d.date.isSameDate(element.time.startTime)).toList(),
                            date: d.date,
                            isActiveMonth: d.isActiveMonth,
                            onTap: () {
                              setState(() {
                                if (!d.isActiveMonth) {
                                  // If the tapped date is not in the active month, change the month
                                  selectedMonth = DateTime(d.date.year, d.date.month, 1);
                                }
                                selectedDate = d.date;
                                getEvents();
                                context.read<TodoBloc>().add(ChangeDateEvent(selectedDate!));
                              });
                            },
                            isSelected: selectedDate != null && selectedDate!.isSameDate(d.date),
                            isGreyedOut: !d.isActiveMonth,
                          );
                        },
                      ).toList(),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
