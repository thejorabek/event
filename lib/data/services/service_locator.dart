import 'package:get_it/get_it.dart';
import 'package:udevs_todo/data/datasources/db/sqf_db.dart';
import 'package:udevs_todo/domain/repositories/todo_repository.dart';
import '../../presentation/blocs/todo_bloc/todo_bloc.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<LocalDataSource>(const LocalDataSourceImpl());
  locator.registerSingleton<TodoRepository>(TodoRepositoryImpl(dataSource: locator()));
  locator.registerSingleton<TodoBloc>(TodoBloc(repository: locator()));
}
