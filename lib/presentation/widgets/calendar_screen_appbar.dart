import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udevs_todo/core/constants/colors/colors.dart';
import 'package:udevs_todo/core/constants/device_frame.dart';
import 'package:udevs_todo/core/constants/svg_icons.dart';
import 'package:udevs_todo/core/constants/text_styles.dart';
import 'package:udevs_todo/domain/entities/extensions/date_ext.dart';
import '../blocs/todo_bloc/todo_bloc.dart';
import '../blocs/todo_bloc/todo_state.dart';

class CalendarScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CalendarScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      title: BlocBuilder<TodoBloc, HomeState>(
        builder: (context, state) {
          final time = state.todoModel.current;
          return Column(
            children: [
              Text(
                time.weekday.toWeek(),
                style: Styles.poppins600.copyWith(color: AppColors.brown, fontSize: 16),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${time.day} ${time.month.monthToString()} ${time.year}",
                    style: Styles.poppins400.copyWith(
                      color: AppColors.brown,
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: AppColors.black,
                    size: 15,
                  ),
                ],
              ),
            ],
          );
        },
      ),
      actions: [SvgIcons.notification, FixSize.sized(context, width: 0.1)],
    );
  }
  @override
  Size get preferredSize => const Size(double.infinity, 70);
}
