import 'dart:convert';
import 'package:mobile_dosen/dosen/task_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static String baseUrl = "https://kompenjti.my.id/api";

Future<Map<String, dynamic>> login(String username, String password) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/mahasiswa/login'),
      body: {'username': username, 'password': password},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success']) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', data['token']);
        prefs.setString('id_mahasiswa', data['user']['id_mahasiswa'].toString());
        prefs.setString('username', data['user']['username']);
        prefs.setString('nama', data['user']['nama']);
        prefs.setString('nomor_induk', data['user']['nomor_induk'].toString());
        prefs.setString('periode_tahun', data['user']['periode_tahun'].toString());

        // Check for valid double values before parsing
        double jamAlpha = double.tryParse(data['user']['jam_alpha'].toString()) ?? 0.0;
        double jamKompen = double.tryParse(data['user']['jam_kompen'].toString()) ?? 0.0;
        double jamKompenSelesai = double.tryParse(data['user']['jam_kompen_selesai'].toString()) ?? 0.0;

        return {
          'id_level': data['user']['id_level'],
          'periode_tahun': data['user']['periode_tahun'],
          'nomor_induk': data['user']['nomor_induk'],
          'jam_alpha': jamAlpha,
          'jam_kompen': jamKompen,
          'jam_kompen_selesai': jamKompenSelesai,
        };
      } else {
        throw Exception('Login failed');
      }
    } else {
      throw Exception('Server error: ${response.statusCode}');
    }
  } catch (e) {
    print('Login error: $e');
    throw Exception('Error: $e');
  }
}


static Future<List<dynamic>> fetchCompetencies() async {
    final url = Uri.parse('https://kompenjti.my.id/api/kompen');  // URL API

    try {
      final response = await http.get(url);  // Melakukan request GET
      if (response.statusCode == 200) {
        // Jika berhasil, mengembalikan data yang di-decode
        final data = json.decode(response.body);

        // Memeriksa apakah data memiliki field 'data' yang berisi array kompetensi
        if (data is Map<String, dynamic> && data.containsKey('data')) {
          return data['data'];  // Mengambil list kompetensi dari field 'data'
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        throw Exception('Failed to load competencies');
      }
    } catch (e) {
      throw Exception('Error fetching competencies: $e');
    }
  }

  static Future<Map<String, dynamic>> fetchKompenData() async {
  final url = Uri.parse('$baseUrl/dashboard'); // Ganti dengan URL endpoint API Anda

  try {
    final response = await http.get(url);  // Melakukan request GET
    if (response.statusCode == 200) {
      // Jika berhasil, mengembalikan data yang di-decode
      final data = json.decode(response.body);

      // Pastikan data yang diterima sesuai dengan yang diharapkan
      if (data is Map<String, dynamic>) {
        return {
          'periode_tahun': data['periode_tahun'],
          'jam_alpha': data['jam_alpha'],
          'jam_kompen': data['jam_kompen'],
          'jam_kompen_selesai': data['jam_kompen_selesai'],
        };
      } else {
        throw Exception('Invalid data format');
      }
    } else {
      throw Exception('Failed to load kompen data');
    }
  } catch (e) {
    throw Exception('Error fetching kompen data: $e');
  }
}
  
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

Future<List<dynamic>> fetchHistoriKompen(
      String token, String idMahasiswa) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/histori_mahasiswa/list?id_mahasiswa=$idMahasiswa'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is List) {
          return data; // Mengembalikan list histori kompen
        } else {
          throw Exception('Format data tidak valid.');
        }
      } else {
        throw Exception(
            'Gagal memuat histori kompen, kode status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan saat mengambil histori kompen: $e');
    }
  }

}
