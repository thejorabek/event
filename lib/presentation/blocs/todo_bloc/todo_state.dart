import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../event_todo.dart';

enum HomeStatus {
  initial,
  loading,
  successData,
  errorData,
  successCreatedData,
  successDeletedData,
  successUpdatedData,
  changeTime,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final String? error;
  final EventTodo todoModel;
  final TimeOfDay startTime;
  final TimeOfDay finishTime;

  const HomeState({
    required this.startTime,
    required this.finishTime,
    required this.status,
    required this.todoModel,
    this.error,
  });

  @override
  List<Object?> get props => [status, todoModel, startTime, finishTime, error];

  HomeState copyWith({
    HomeStatus? status,
    String? error,
    EventTodo? todoModel,
    TimeOfDay? startTime,
    TimeOfDay? finishTime,
  }) {
    return HomeState(
      status: status ?? this.status,
      error: error ?? this.error,
      todoModel: todoModel ?? this.todoModel,
      startTime: startTime ?? this.startTime,
      finishTime: finishTime ?? this.finishTime,
    );
  }
}
