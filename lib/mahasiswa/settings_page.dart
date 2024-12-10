import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../login.dart'; // Pastikan halaman Login sudah diimport
import 'privacy_policy.dart'; // Impor halaman Kebijakan Privasi
import 'help_page.dart'; // Impor halaman Bantuan

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Pengaturan',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFD700),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   'Akun',
                    //   style: TextStyle(
                    //     fontSize: 18.0,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.grey[700],
                    //   ),
                    // ),
                    // SizedBox(height: 8.0),
                    // _buildSettingsButton(
                    //   'Akun Pribadi',
                    //   () {},
                    // ),
                    SizedBox(height: 24.0),
                    Text(
                      'Lainnya',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 8.0),
                    _buildSettingsButton(
                      'Kebijakan Privasi',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
                        );
                      },
                    ),
                    SizedBox(height: 8.0),
                    _buildSettingsButton(
                      'Bantuan',
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HelpPage()),
                        );
                      },
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _logout(context); // Panggil fungsi logout
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            'KELUAR',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menghapus session dan mengarahkan ke halaman login
  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    // Menghapus session
    await prefs.remove('user_id');  // Misalkan 'user_id' adalah session key yang disimpan saat login

    // Mengarahkan pengguna ke halaman login setelah logout
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()), // Ganti dengan halaman login Anda
      (Route<dynamic> route) => false, // Menghapus semua route sebelumnya
    );
  }

  Widget _buildSettingsButton(String text, VoidCallback onTap) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 8.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFFF8E1),
          padding: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
