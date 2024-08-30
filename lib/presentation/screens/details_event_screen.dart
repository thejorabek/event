import 'package:flutter/material.dart';
import 'package:udevs_todo/core/constants/colors/colors.dart';
import 'package:udevs_todo/core/constants/router/route.dart';
import 'package:udevs_todo/core/constants/svg_icons.dart';
import 'package:udevs_todo/core/constants/text_styles.dart';
import 'package:udevs_todo/data/models/todo_model.dart';
import 'package:udevs_todo/data/services/service_locator.dart';
import '../blocs/todo_bloc/todo_bloc.dart';
import '../blocs/todo_bloc/todo_event.dart';
import '../widgets/custom_button.dart';
import '../../domain/usecases/detail/widgets/view_todo_body.dart';
import '../../domain/usecases/detail/widgets/view_todo_header.dart';

class DetailsEventScreen extends StatelessWidget {
  final TodoModel todoModel;
  static const String id = "details_event";

  const DetailsEventScreen({super.key, required this.todoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(
            backPress: () => backButton(context),
            editPress: () => editButton(context),
            title: todoModel.eventTitle,
            description: todoModel.eventDescription,
            time:
                '${todoModel.time.startTime.hour}:${todoModel.time.startTime.minute} - ${todoModel.time.finishTime.hour}:${todoModel.time.startTime.minute}',
            location: todoModel.eventLocation,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.sizeOf(context).height * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ViewTodoBody(
                    reminder: "${todoModel.remainder} minutes before",
                    description: todoModel.eventDescription,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      onPressed: () => deleteButton(context),
                      width: MediaQuery.sizeOf(context).width * 0.85,
                      height: MediaQuery.sizeOf(context).height * 0.06,
                      backgroundColor: AppColors.pink100,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgIcons.fluentDeleteFilled,
                          Text(
                            "Delete Event",
                            style: Styles.poppins600.copyWith(
                              fontSize: 16,
                              color: AppColors.brown,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void backButton(BuildContext context) {
    Navigator.pop(context);
  }

  void editButton(BuildContext context) {
    AppRoute.pushEditEvent(context, todoModel);
  }

  void deleteButton(BuildContext context) async {
    locator.get<TodoBloc>().add(DeleteTodoEvent(id: todoModel.id));
    Navigator.pop(context);
  }
}
