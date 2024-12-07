import 'package:flutter/material.dart';
import 'login_page.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade100,
        elevation: 0,
        title: const Text(
          'Pengaturan',
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Akun',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 10),
            const SettingOption(title: 'Akun Pribadi'),
            SizedBox(height: 20),
            Text(
              'Lainnya',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 10),
            const SettingOption(title: 'Kebijakan Privasi'),
            const SizedBox(height: 10),
            const SettingOption(title: 'Bantuan'),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logika logout dan navigasi ke halaman login
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false, // Menghapus semua halaman sebelumnya
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'KELUAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingOption extends StatelessWidget {
  final String title;

  const SettingOption({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Menyesuaikan lebar layar penuh
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0), // Menambahkan margin untuk memberi jarak dari sisi layar
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey.shade800,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

