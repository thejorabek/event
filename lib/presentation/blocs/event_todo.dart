import 'package:equatable/equatable.dart';
import 'package:udevs_todo/data/models/todo_model.dart';

class EventTodo extends Equatable {
  final List<TodoModel> allTodos;
  final List<TodoModel> todos;
  final DateTime current;

  const EventTodo({
    required this.allTodos,
    required this.todos,
    required this.current,
  });

  @override
  String toString() {
    return 'EventTodo{todos: $todos, current: $current}';
  }

  @override
  List<Object?> get props => [allTodos, todos, current];
}
