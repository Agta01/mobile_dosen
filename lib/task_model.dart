import 'package:flutter/material.dart';

class Task {
  final String title;
  final String status;
  final Color color;

  Task({required this.title, required this.status, required this.color});

  Task copyWith({String? title, String? status, Color? color}) {
    return Task(
      title: title ?? this.title,
      status: status ?? this.status,
      color: color ?? this.color,
    );
  }
}
