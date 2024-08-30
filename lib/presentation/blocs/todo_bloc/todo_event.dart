import 'package:flutter/material.dart';
import 'package:udevs_todo/data/models/todo_model.dart';

sealed class HomeEvent {
  const HomeEvent();
}

class GetDataEvent extends HomeEvent {
  const GetDataEvent();
}

class ChangeDateEvent extends HomeEvent {
  final DateTime selectedDate;

  const ChangeDateEvent(this.selectedDate);
}

class CreateTodoEvent extends HomeEvent {
  final String name;
  final String description;
  final String title;
  final String location;
  final int color;
  final int reminder;

  const CreateTodoEvent({
    required this.name,
    required this.description,
    required this.location,
    required this.title,
    required this.color,
    required this.reminder,
  });
}

class DeleteTodoEvent extends HomeEvent {
  final int id;

  const DeleteTodoEvent({required this.id});
}

class UpdateTodoEvent extends HomeEvent {
  final TodoModel todoModel;

  const UpdateTodoEvent({
    required this.todoModel,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is UpdateTodoEvent && runtimeType == other.runtimeType && todoModel == other.todoModel;

  @override
  int get hashCode => todoModel.hashCode;
}

class CreateChangeStartDateEvent extends HomeEvent {
  final TimeOfDay time;
  const CreateChangeStartDateEvent({required this.time});
}

class CreateChangeFinishDateEvent extends HomeEvent {
  final TimeOfDay time;
  const CreateChangeFinishDateEvent({required this.time});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is CreateChangeFinishDateEvent && runtimeType == other.runtimeType && time == other.time;

  @override
  int get hashCode => time.hashCode;
}
