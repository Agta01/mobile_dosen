import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bantuan'),
        backgroundColor: const Color(0xFFFFD700),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            'Ini adalah halaman Bantuan. Jika Anda mengalami masalah atau membutuhkan '
            'bantuan, silakan hubungi layanan pelanggan kami atau periksa panduan '
            'pengguna.',
            style: TextStyle(fontSize: 16.0, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
