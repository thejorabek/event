import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udevs_todo/data/datasources/db/sqf_db.dart';
import 'package:udevs_todo/data/services/service_locator.dart';
import 'app.dart';
import 'presentation/blocs/listener_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = ListenerBlocObserver();
  setupLocator();
  await LocalDataSourceImpl.init();
  runApp(const TodoApp());
}
