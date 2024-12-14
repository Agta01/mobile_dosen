import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kebijakan Privasi'),
        backgroundColor: const Color(0xFFFFD700), // Eye-catching gold color
        elevation: 0, // Remove shadow for a cleaner look
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0), // Proportional padding
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
            children: <Widget>[
              // Heading with space for clarity
              Text(
                'Kebijakan Privasi Aplikasi Mahasiswa',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16.0), // Space between heading and text
              
              // Paragraph with easy-to-read text
              Text(
                'Selamat datang di aplikasi kami! Kami sangat menghargai privasi Anda dan berkomitmen untuk melindungi informasi pribadi yang Anda berikan. Berikut adalah kebijakan privasi kami yang menjelaskan cara kami mengumpulkan, menggunakan, dan melindungi data Anda sebagai pengguna aplikasi:\n\n'
                '1. **Informasi yang dikumpulkan**: Kami mengumpulkan informasi dasar seperti nama, username, dan data akademik untuk menyediakan pengalaman yang lebih baik dalam aplikasi.\n\n'
                '2. **Bagaimana informasi digunakan**: Data yang kami kumpulkan akan digunakan untuk tujuan akademik dan administratif yang mendukung pembelajaran dan pengelolaan tugas.\n\n'
                '3. **Keamanan data**: Kami memastikan bahwa data yang dikumpulkan disimpan dengan aman dan hanya dapat diakses oleh pihak yang berwenang sesuai kebijakan universitas.\n\n'
                '4. **Hak-hak pengguna**: Anda memiliki hak untuk mengakses, memperbarui, atau menghapus informasi pribadi Anda kapan saja melalui pengaturan akun di aplikasi.\n\n'
                'Kami berkomitmen untuk menjaga privasi dan keamanan data Anda, serta memastikan bahwa aplikasi ini hanya digunakan untuk tujuan yang sah dan bermanfaat bagi pengalaman belajar Anda.',
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.5, // Spacing between lines for readability
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
