import 'package:flutter/material.dart';
import 'add_task.dart';
import 'task_card.dart';
import 'task_model.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  // List to store tasks dynamically
  List<Task> tasks = [
    Task(title: 'Layouting Jurnal Dosen Sertifikasi', status: 'Tugas Pekerjaan', color: Color(0xFF4A3AFF)),
    Task(title: 'Layouting Jurnal Mahasiswa Tingkat Akhir', status: 'Tugas Pekerjaan', color: Color(0xFFFFB800)),
    Task(title: 'Memasukan Data Kedalam Microsoft', status: 'Selesai', color: Color(0xFF00BA88)),
  ];

  // Function to add a new task
  void addTask(String title) {
    setState(() {
      tasks.add(Task(title: title, status: 'Tunggu Pengajuan', color: Color(0xFFFFB800)));
    });
  }

  // Function to update task status
  void updateTaskStatus(int index) {
    setState(() {
      if (tasks[index].status == 'Tunggu Pengajuan') {
        tasks[index] = tasks[index].copyWith(status: 'Sedang Diproses', color: Color(0xFF4A90E2));
      } else if (tasks[index].status == 'Sedang Diproses') {
        tasks[index] = tasks[index].copyWith(status: 'Selesai', color: Color(0xFF00BA88));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TUGAS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFB800),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final newTaskTitle = await Navigator.push<String>(
                  context,
                  MaterialPageRoute(builder: (context) => const AddTaskScreen()),
                );
                if (newTaskTitle != null && newTaskTitle.isNotEmpty) {
                  addTask(newTaskTitle);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFB800),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Tambah Tugas',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => updateTaskStatus(index),
                    child: TaskCard(
                      title: tasks[index].title,
                      status: tasks[index].status,
                      color: tasks[index].color,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
