import 'package:flutter/material.dart';

// class Task {
//   final String title;
//   final String status;
//   final Color color;

//   Task({required this.title, required this.status, required this.color});

//   Task copyWith({String? title, String? status, Color? color}) {
//     return Task(
//       title: title ?? this.title,
//       status: status ?? this.status,
//       color: color ?? this.color,
//     );
//   }

//   // Membuat konstruktor dari map untuk parsing JSON
//   factory Task.fromJson(Map<String, dynamic> json) {
//     return Task(
//       title: json['nama_tugas'],
//       status: json['status'] ?? 'Tunggu Pengajuan',
//       color: Color(0xFFFFB800), // Misalnya, warna default
//     );
//   }
// }

// class Task {
//   final String title;
//   String status; 
//   final String description;
//   final Color color;

//   Task({
//     required this.title,
//     this.status = 'Proses Pengajuan', // Status default
//     this.description = 'Tidak ada deskripsi',
//     this.color = const Color(0xFFFFB800),
//   });

//   Task copyWith({
//     String? title,
//     String? status,
//     String? description,
//     Color? color,
//   }) {
//     return Task(
//       title: title ?? this.title,
//       status: status ?? this.status,
//       description: description ?? this.description,
//       color: color ?? this.color,
//     );
//   }
//}

class Task {
  final int id;
  final String title;
  String status;
  final String description;
  final Color color;

  Task({
    required this.id,
    required this.title,
    this.status = 'Tunggu Pengajuan', 
    this.description = 'Tidak ada deskripsi',
    this.color = const Color(0xFFFFB800),
  });

  Task copyWith({
    int? id,
    String? title,
    String? status,
    String? description,
    Color? color,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
      description: description ?? this.description,
      color: color ?? this.color,
    );
  }
}

