import 'package:flutter/material.dart';

extension WeekToString on int {
  String toWeek() {
    return switch (this) {
      1 => "Monday",
      2 => "Tuesday",
      3 => "Wednesday",
      4 => "Thursday",
      5 => "Friday",
      6 => "Saturday",
      7 => "Sunday",
      _ => "",
    };
  }

  String monthToString() {
    return switch (this) {
      1 => "January",
      2 => "February",
      3 => "March",
      4 => "April",
      5 => "May",
      6 => "June",
      7 => "July",
      8 => "August",
      9 => "September",
      10 => "October",
      11 => "November",
      12 => "December",
      _ => "",
    };
  }
}

extension DateTimeExt on DateTime {
  String toHM() {
    return "$hour:$minute";
  }
}

extension TimeOfDayExt on TimeOfDay {
  String toHM() {
    return "$hour:$minute";
  }
}
