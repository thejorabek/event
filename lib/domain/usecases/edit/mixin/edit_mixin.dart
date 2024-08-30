part of '../../../../presentation/screens/edit_event_screen.dart';

mixin EditMixin on State<EditEventScreen> {
  final TextEditingController eventNameController = TextEditingController();

  final TextEditingController eventTitleController = TextEditingController();

  final TextEditingController eventLocationController = TextEditingController();

  int priorityColorController = 0;

  final TextEditingController timeController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    descriptionController.text = widget.todoModel.eventDescription;
    eventLocationController.text = widget.todoModel.eventLocation;
    priorityColorController = widget.todoModel.priorityColor;
    eventTitleController.text = widget.todoModel.eventTitle;
    super.initState();
  }

  void editEvent() {
    final TodoModel model = TodoModel(
      id: widget.todoModel.id,
      eventDescription: descriptionController.text.trim(),
      eventLocation: eventLocationController.text.trim(),
      priorityColor: priorityColorController,
      time: widget.todoModel.time,
      remainder: 15,
      eventTitle: eventTitleController.text.trim(),
    );

    locator.get<TodoBloc>().add(UpdateTodoEvent(todoModel: model));
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
