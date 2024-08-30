import 'package:flutter/material.dart';

import '../../../presentation/screens/add_event_screen.dart';
import '../../../presentation/screens/details_event_screen.dart';
import '../../../presentation/screens/edit_event_screen.dart';
import '../../../presentation/screens/calendar_screen.dart';
import '../../../data/models/todo_model.dart';

sealed class AppRoute {

  static String get initialRoute => CalendarScreen.id;
  static Map<String, Widget Function(BuildContext)> routes = {
    CalendarScreen.id: (context) => const CalendarScreen(),
    AddEventScreen.id: (context) => const AddEventScreen(),
  };

  // Push Page
  static void pushHome(BuildContext context) {
    Navigator.pushNamed(context, CalendarScreen.id);
  }

  static Future<T?> pushAddEvent<T>(BuildContext context) {
    return Navigator.pushNamed(context, AddEventScreen.id);
  }

  static Future<T?> pushEditEvent<T>(BuildContext context, TodoModel todo) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditEventScreen(todoModel: todo),
      ),
    );
  }

  static Future<T?> pushDetailsEvent<T>(BuildContext context, TodoModel todo) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsEventScreen(todoModel: todo),
      ),
    );
  }

  static void home(BuildContext context) {
    Navigator.pushReplacementNamed(context, CalendarScreen.id);
  }

  static void addEvent(BuildContext context) {
    Navigator.pushReplacementNamed(context, AddEventScreen.id);
  }

  static void editEvent(BuildContext context) {
    Navigator.pushReplacementNamed(context, EditEventScreen.id);
  }

  static void detailsEvent(BuildContext context) {
    Navigator.pushReplacementNamed(context, DetailsEventScreen.id);
  }

  // Remove Until To Home
  static void removeToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      CalendarScreen.id,
      (route) => false,
    );
  }
}
