import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udevs_todo/core/constants/router/route.dart';
import 'package:udevs_todo/data/services/service_locator.dart';
import 'presentation/blocs/todo_bloc/todo_bloc.dart';
import 'presentation/blocs/todo_bloc/todo_event.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<TodoBloc>()..add(const GetDataEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.light,
        initialRoute: AppRoute.initialRoute,
        routes: AppRoute.routes,
      ),
    );
  }
}
