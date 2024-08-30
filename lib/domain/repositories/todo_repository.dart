import 'package:flutter/material.dart';
import 'package:udevs_todo/data/datasources/db/sqf_db.dart';
import 'package:udevs_todo/data/models/todo_model.dart';

abstract interface class TodoRepository {
  const TodoRepository();

  Future<bool> createData(TodoModel todoModel);

  Future<bool> deleteData(int id);

  Future<List<TodoModel>> getAllData();

  Future<TodoModel?> getData(int id);

  Future<bool> updateData(int id, TodoModel todoModel);

  Future<List<TodoModel>> getFilteredData(DateTime time);
}

class TodoRepositoryImpl implements TodoRepository {
  final LocalDataSource dataSource;

  const TodoRepositoryImpl({required this.dataSource});

  @override
  Future<bool> createData(TodoModel todoModel) async {
    try {
      await dataSource.insert(table: SqlTable.todos, data: todoModel.toMap());
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> deleteData(int id) async {
    try {
      await dataSource.delete(table: SqlTable.todos, id: id);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<List<TodoModel>> getAllData() async {
    try {
      final response = await dataSource.readAll(table: SqlTable.todos);
      return response.map((data) => TodoModel.fromJson(data)).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Future<TodoModel?> getData(int id) async {
    try {
      final response = await dataSource.read(table: SqlTable.todos, id: id);
      return TodoModel.fromJson(response);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<List<TodoModel>> getFilteredData(DateTime time) async {
    try {
      final response = await dataSource.readAllFilteredDay(table: SqlTable.todos, time: time);
      return response.map((data) => TodoModel.fromJson(data)).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Future<bool> updateData(int id, TodoModel todoModel) async {
    try {
      await dataSource.update(table: SqlTable.todos, data: todoModel.toMap(), id: id);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
