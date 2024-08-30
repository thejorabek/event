import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udevs_todo/data/models/todo_model.dart';
import 'package:udevs_todo/domain/repositories/todo_repository.dart';
import '../event_todo.dart';
import 'todo_event.dart';
import 'todo_state.dart';

/// Bloc
class TodoBloc extends Bloc<HomeEvent, HomeState> {
  final TodoRepository repository;

  TodoBloc({required this.repository})
      : super(
          HomeState(
              status: HomeStatus.initial,
              todoModel: EventTodo(
                allTodos: const [],
                todos: const [],
                current: DateTime.now(),
              ),
              startTime: TimeOfDay.now(),
              finishTime: TimeOfDay.now()),
        ) {
    on<HomeEvent>(
      (event, emit) => switch (event) {
        GetDataEvent e => _loading(e, emit),
        CreateTodoEvent e => _create(e, emit),
        DeleteTodoEvent e => _delete(e, emit),
        UpdateTodoEvent e => _update(e, emit),
        ChangeDateEvent e => _changeDate(e, emit),
        // ignore: unused_local_variable
        CreateChangeStartDateEvent e => _changeStartTime(event, emit),
        // ignore: unused_local_variable
        CreateChangeFinishDateEvent e => _changeFinishTime(event, emit),
      },
    );
  }

  void _loading(GetDataEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      List<TodoModel> response = await repository.getAllData();
      List<TodoModel> filteredData = await repository.getFilteredData(
        state.todoModel.current,
      );
      emit(state.copyWith(
        status: HomeStatus.successData,
        todoModel: EventTodo(
          todos: filteredData,
          current: state.todoModel.current,
          allTodos: response,
        ),
      ));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.errorData, error: "$e"));
    }
  }

  void _create(CreateTodoEvent event, Emitter<HomeState> emit) async {
    try {
      final model = TodoModel(
        id: 01,
        eventDescription: event.description,
        eventLocation: event.location,
        priorityColor: event.color,
        time: EventTime(
          state.todoModel.current.copyWith(hour: state.startTime.hour, minute: state.startTime.minute),
          state.todoModel.current.copyWith(hour: state.finishTime.hour, minute: state.finishTime.minute),
        ),
        remainder: event.reminder,
        eventTitle: event.title,
      );
      await repository.createData(model);
      emit(state.copyWith(status: HomeStatus.successCreatedData));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.errorData, error: "$e"));
    }
  }

  void _delete(DeleteTodoEvent event, Emitter<HomeState> emit) async {
    try {
      await repository.deleteData(event.id);
      emit(state.copyWith(status: HomeStatus.successDeletedData));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.errorData, error: "$e"));
    }
  }

  void _update(UpdateTodoEvent event, Emitter<HomeState> emit) async {
    try {
      await repository.updateData(event.todoModel.id, event.todoModel);
      emit(state.copyWith(status: HomeStatus.successUpdatedData));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.errorData, error: "$e"));
    }
  }

  void _changeDate(ChangeDateEvent event, Emitter<HomeState> emit) async {
    final List<TodoModel> filteredData = await repository.getFilteredData(
      event.selectedDate,
    );

    emit(state.copyWith(
      status: HomeStatus.successData,
      todoModel: EventTodo(
        todos: filteredData,
        current: event.selectedDate,
        allTodos: state.todoModel.allTodos,
      ),
    ));
  }

  void _changeStartTime(CreateChangeStartDateEvent event, Emitter emit) {
    emit(state.copyWith(status: HomeStatus.changeTime, startTime: event.time));
  }

  void _changeFinishTime(CreateChangeFinishDateEvent event, Emitter emit) {
    emit(state.copyWith(status: HomeStatus.changeTime, startTime: event.time));
  }
}
