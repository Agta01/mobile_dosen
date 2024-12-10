import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kebijakan Privasi'),
        backgroundColor: const Color(0xFFFFD700), // Warna gold yang eye-catching
        elevation: 0, // Menghilangkan bayangan di bawah app bar untuk tampilan yang lebih bersih
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0), // Padding yang lebih proporsional
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Agar teks tidak menjorok ke tengah
            children: <Widget>[
              // Heading dengan sedikit space
              Text(
                'Kebijakan Privasi',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16.0), // Memberikan space antara heading dan isi teks
              
              // Paragraf dengan teks yang lebih mudah dibaca
              Text(
                'Ini adalah halaman Kebijakan Privasi. Anda dapat menyesuaikan teks ini '
                'dengan kebijakan privasi aplikasi Anda. Pastikan semua informasi yang '
                'dibutuhkan tercakup dengan baik. Berikut adalah beberapa poin penting yang harus '
                'diperhatikan dalam kebijakan privasi aplikasi:\n\n'
                '1. Informasi yang dikumpulkan dari pengguna\n'
                '2. Bagaimana informasi tersebut digunakan\n'
                '3. Perlindungan data pengguna\n'
                '4. Hak-hak pengguna terkait informasi pribadi\n\n'
                'Kami berkomitmen untuk menjaga privasi pengguna dan memastikan bahwa data yang '
                'dikumpulkan aman serta digunakan hanya untuk tujuan yang sah.',
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.5, // Mengatur jarak antar baris agar teks lebih mudah dibaca
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
