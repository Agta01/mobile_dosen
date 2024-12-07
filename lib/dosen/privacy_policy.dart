import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kebijakan Privasi'),
        backgroundColor: const Color(0xFFFFD700),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            'Ini adalah halaman Kebijakan Privasi. Anda dapat menyesuaikan teks ini '
            'dengan kebijakan privasi aplikasi Anda. Pastikan semua informasi yang '
            'dibutuhkan tercakup dengan baik.',
            style: TextStyle(fontSize: 16.0, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
