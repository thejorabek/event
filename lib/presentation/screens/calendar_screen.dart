import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udevs_todo/core/constants/device_frame.dart';
import 'package:udevs_todo/core/constants/router/route.dart';
import 'package:udevs_todo/data/services/service_locator.dart';
import 'package:udevs_todo/domain/entities/extensions/date_ext.dart';
import 'package:udevs_todo/presentation/widgets/calendar_screen_appbar.dart';
import '../blocs/todo_bloc/todo_bloc.dart';
import '../blocs/todo_bloc/todo_event.dart';
import '../blocs/todo_bloc/todo_state.dart';
import '../widgets/calendar_widget.dart';
import '../widgets/schedules.dart';
import '../widgets/todo_tile.dart';

class CalendarScreen extends StatefulWidget {
  static const String id = "home";

  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoBloc, HomeState>(
      listener: (context,state){},
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CalendarScreenAppBar(),
        body: Column(
          children: [
            Expanded(
              flex: 5,
              child: BlocBuilder<TodoBloc, HomeState>(
                builder: (context, state) {
                  return Calendar(
                    todos: state.todoModel.allTodos,
                  );
                },
              ),
            ),
            CalendarBottom(
              addEvent: () async {
                AppRoute.pushAddEvent(context).whenComplete(() {
                  locator.get<TodoBloc>().add(const GetDataEvent());
                });
              },
            ),
            FixSize.sized(context, height: 0.02),
            Expanded(
              flex: 3,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: BlocBuilder<TodoBloc, HomeState>(
                    buildWhen: (previous, current) {
                      return current.status == HomeStatus.successData;
                    },
                    builder: (context, state) {
                      return ListView.separated(
                        primary: false,
                        itemBuilder: (context, index) {
                          final todo = state.todoModel.todos[index];
                          final Color color = Colors.primaries[todo.priorityColor];
                          return GestureDetector(
                            onTap: () async {
                              AppRoute.pushDetailsEvent(context, todo).whenComplete(() {
                                locator.get<TodoBloc>().add(const GetDataEvent());
                              });
                            },
                            child: TodoTile(
                              eventDescription: todo.eventDescription,
                              eventTitle: todo.eventTitle,
                              color: color.withOpacity(0.8),
                              eventTime: "${todo.time.startTime.toHM()} - ${todo.time.finishTime.toHM()}",
                              eventLocation: todo.eventLocation,
                              textColor: color,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 15),
                        itemCount: state.todoModel.todos.length,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
