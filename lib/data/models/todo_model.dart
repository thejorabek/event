import 'dart:convert';

class TodoModel {
  final int id;
  final String eventTitle;
  final String eventDescription;
  final String eventLocation;
  final int priorityColor;
  final EventTime time;
  final int remainder;

  TodoModel({
    required this.id,
    required this.eventDescription,
    required this.eventLocation,
    required this.priorityColor,
    required this.time,
    required this.remainder,
    required this.eventTitle,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json["id"],
        eventDescription: json["eventDescription"],
        eventLocation: json["eventLocation"],
        priorityColor: json["priorityColor"],
        time: EventTime.fromJson(json["time"]),
        remainder: json["remainder"],
        eventTitle: json["eventTitle"],
      );

  Map<String, dynamic> toMap() => {
        "eventTitle": eventTitle,
        "eventDescription": eventDescription,
        "eventLocation": eventLocation,
        "priorityColor": priorityColor,
        "time": jsonEncode(time.toMap()),
        "remainder": remainder,
      };
}

class EventTime {
  final DateTime startTime;
  final DateTime finishTime;

  const EventTime._(this.startTime, this.finishTime);

  factory EventTime(DateTime start, DateTime finish) {
      return EventTime._(start, finish);
  }

  factory EventTime.fromJson(String json) {
    final result = jsonDecode(json) as Map<String, dynamic>;
    return EventTime(DateTime.parse(result["startTime"]),
        DateTime.parse(result["finishTime"]));
  }

  Map<String, dynamic> toMap() => {
        "startTime": startTime.toIso8601String(),
        "finishTime": finishTime.toIso8601String(),
      };

  @override
  String toString() {
    return 'EventTime{startTime: $startTime, finishTime: $finishTime}';
  }
}
