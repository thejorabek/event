import 'package:flutter/material.dart';
import 'package:udevs_todo/core/constants/colors/colors.dart';
import 'package:udevs_todo/core/constants/device_frame.dart';
import 'package:udevs_todo/core/constants/text_styles.dart';
import 'package:udevs_todo/data/models/todo_model.dart';
import 'package:udevs_todo/data/services/service_locator.dart';
import '../blocs/todo_bloc/todo_bloc.dart';
import '../blocs/todo_bloc/todo_event.dart';
import '../../domain/usecases/create/widgets/custom_drop_button.dart';
import '../../domain/usecases/create/widgets/custom_field_location.dart';
import '../../domain/usecases/create/widgets/custom_text_field.dart';
import '../../domain/usecases/create/widgets/input_hint_text.dart';
import '../widgets/custom_button.dart';

part '../../domain/usecases/edit/mixin/edit_mixin.dart';

class EditEventScreen extends StatefulWidget {
  final TodoModel todoModel;
  static const String id = "edit_event";

  const EditEventScreen({super.key, required this.todoModel});

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> with EditMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.grey500,
            size: 35,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.88,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 13,
                  right: 13,
                  top: 10,
                  bottom: MediaQuery.sizeOf(context).height * 0.01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InputHintText(
                      label: "Event title",
                    ),
                    FixSize.sized(context, height: 0.005),
                    CustomTextField(
                      controller: eventTitleController,
                    ),
                    FixSize.sized(context, height: 0.02),
                    const InputHintText(
                      label: "Event description",
                    ),
                    FixSize.sized(context, height: 0.005),
                    CustomTextField(
                      line: 3,
                      controller: descriptionController,
                    ),
                    FixSize.sized(context, height: 0.02),
                    const InputHintText(
                      label: "Event location",
                    ),
                    FixSize.sized(context, height: 0.005),
                    CustomFieldLocation(
                      controller: eventLocationController,
                    ),
                    FixSize.sized(context, height: 0.02),
                    const InputHintText(
                      label: "Priority color",
                    ),
                    FixSize.sized(context, height: 0.01),
                    CustomDropButton(
                      colors: [for (int i = 0; i <= 17; i++) i],
                      onChange: (color) {
                        priorityColorController = color;
                      },
                    ),
                    FixSize.sized(context, height: 0.02),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                width: MediaQuery.sizeOf(context).width * 0.95,
                height: MediaQuery.sizeOf(context).height * 0.06,
                onPressed: editEvent,
                child: Text(
                  "Edit",
                  style: Styles.poppins400.copyWith(
                    fontSize: 16,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
