import 'dart:convert';
import 'package:mobile_dosen/dosen/task_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseUrl = "http://127.0.0.1:8000/api";

//   Future<String> login(String username, String password) async {
//   try {
//     final response = await http.post(
//       Uri.parse('$baseUrl/api/login'),
//       body: {'username': username, 'password': password},
//     );

//     print('Response: ${response.body}'); // Tambahkan untuk melihat respons

//     if (response.statusCode == 201) {
//       final data = jsonDecode(response.body);
//       if (data['success']) {
//         return data['username'];
//       } else {
//         throw Exception('Login gagal');
//       }
//     } else {
//       throw Exception('Kesalahan server: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error: $e'); // Debug error detail
//     throw Exception('Terjadi kesalahan: $e');
//   }
// }

//  Future<String> login(String username, String password) async {
//   try {
//     final response = await http.post(
//       Uri.parse('$baseUrl/login'),
//       body: {'username': username, 'password': password},
//     );

//     print('Response Status Code: ${response.statusCode}');
//     print('Response Body: ${response.body}');

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       if (data['success']) {
//         // Simpan token di SharedPreferences
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.setString('token', data['token']); // Simpan token
//         return data['user']['username']; // Mengembalikan username
//       } else {
//         throw Exception('Login gagal');
//       }
//     } else {
//       throw Exception('Kesalahan server: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error: $e'); // Debugging error
//     throw Exception('Terjadi kesalahan: $e');
//   }
// }

Future<int> login(String username, String password) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {'username': username, 'password': password},
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success']) {
        // Simpan token di SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', data['token']); // Simpan token

        // Mengembalikan level_id pengguna untuk login
        return data['user']['level_id']; // Mengembalikan level_id
      } else {
        throw Exception('Login gagal');
      }
    } else {
      throw Exception('Kesalahan server: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e'); // Debugging error
    throw Exception('Terjadi kesalahan: $e');
  }
}

// Future<List<Task>> fetchTasks() async {
//     try {
//       final response = await http.get(Uri.parse('$baseUrl/user'));

//       if (response.statusCode == 200) {
//         List<dynamic> data = json.decode(response.body);
//         List<Task> tasks = data.map((taskJson) {
//           return Task(
//             title: taskJson['username'], // Ganti dengan nama field dari API
//             status: taskJson['nama'] ?? 'Tunggu Pengajuan', // Default jika status kosong
//             color: Color(0xFFFFB800), // Ubah sesuai dengan kebutuhan
//           );
//         }).toList();
//         return tasks;
//       } else {
//         throw Exception('Gagal mengambil data tugas');
//       }
//     } catch (e) {
//       rethrow;
//     }
//   }

// Future<List<Task>> fetchTasks() async {
//   try {
//     final response = await http.get(Uri.parse('$baseUrl/user'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       List<Task> tasks = data.map((taskJson) {
//         return Task(
//           title: taskJson['username'], // Ganti dengan field API yang sesuai
//           status: taskJson['nama'] ?? 'Tunggu Pengajuan',
//           description: taskJson['description'] ?? 'Tidak ada deskripsi', // Pastikan field ini ada
//           color: const Color(0xFFFFB800),
//         );
//       }).toList();
//       return tasks;
//     } else {
//       throw Exception('Gagal mengambil data tugas');
//     }
//   } catch (e) {
//     rethrow;
//   }
// }
Future<List<Task>> fetchTasks() async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/user'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Task> tasks = data.asMap().entries.map((entry) {
        int index = entry.key; // Gunakan indeks sebagai ID jika tidak ada ID dari API
        var taskJson = entry.value;

        return Task(
          id: taskJson['id'] ?? index, // Ambil ID dari API atau gunakan indeks
          title: taskJson['username'], // Sesuaikan field API
          status: taskJson['nama'] ?? 'Tunggu Pengajuan',
          description: taskJson['description'] ?? 'Tidak ada deskripsi', // Field deskripsi
          color: const Color(0xFFFFB800),
        );
      }).toList();
      return tasks;
    } else {
      throw Exception('Gagal mengambil data tugas');
    }
  } catch (e) {
    rethrow;
  }
}

//   Future<void> fetchProtectedData() async {
//   // Mengambil token yang disimpan
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? token = prefs.getString('token'); // Ambil token yang disimpan

//   if (token == null) {
//     // Token tidak ada, lakukan penanganan kesalahan (misal: redirect ke login)
//     print('Token tidak ditemukan');
//     return;
//   }

//   // Gunakan token untuk permintaan API yang dilindungi
//   final response = await http.get(
//     Uri.parse('$baseUrl/api/some-protected-route'),
//     headers: {'Authorization': 'Bearer $token'},
//   );

//   if (response.statusCode == 200) {
//     print('Data berhasil diambil: ${response.body}');
//   } else {
//     print('Gagal mengambil data: ${response.statusCode}');
//   }
// }

// Future<void> logout() async {
//   // Menghapus token saat logout
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.remove('token'); // Menghapus token dari SharedPreferences

//   print('Logout berhasil');
// }

}



