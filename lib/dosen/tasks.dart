import 'package:flutter/material.dart';
import 'package:mobile_dosen/api/api_service.dart'; // API Service
import 'package:mobile_dosen/dosen/task_model.dart'; // Task Model
import 'add_task.dart'; // Add Task Screen
import 'task_card.dart'; // Task Card Widget

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final ApiService apiService = ApiService();
  List<Task> tasks = [];

  // Memuat data tugas dari API
  Future<void> loadTasks() async {
    try {
      List<Task> fetchedTasks = await apiService.fetchTasks();
      setState(() {
        tasks = fetchedTasks;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memuat tugas: $e')),
      );
    }
  }

  // Menambahkan tugas baru secara lokal
  void addTask(String title) {
  setState(() {
    tasks.add(
      Task(
        id: tasks.length + 1, // Tambahkan id unik
        title: title,
        status: 'Tunggu Pengajuan',
        description: 'Tugas baru ditambahkan',
        color: const Color(0xFFFFB800),
      ),
    );
  });
}


  // Mengubah status tugas
  void updateTaskStatus(int index) {
    setState(() {
      if (tasks[index].status == 'Tunggu Pengajuan') {
        tasks[index] = tasks[index].copyWith(
          status: 'Sedang Diproses',
          color: const Color(0xFF4A90E2),
        );
      } else if (tasks[index].status == 'Sedang Diproses') {
        tasks[index] = tasks[index].copyWith(
          status: 'Selesai',
          color: const Color(0xFF00BA88),
        );
      }
    });
  }

  // Menampilkan dialog konfirmasi perubahan status
  void showConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Anda yakin ingin mengubah status pengerjaan?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                updateTaskStatus(index);
              },
              child: const Text(
                'Ya',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    loadTasks(); // Memuat data saat pertama kali
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
                  addTask(newTaskTitle); // Tambah tugas baru
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
                    onTap: () => showConfirmationDialog(index),
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
