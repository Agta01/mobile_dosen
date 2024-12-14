import 'package:flutter/material.dart';
// import 'package:mobile_dosen/mahasiswa/dashboardPage.dart';
import 'package:mobile_dosen/mahasiswa/mahasiswa_home.dart';
import 'api/api_service.dart';
// import 'dosen/dosen_home.dart';
// import 'mahasiswa/mahasiswa_home.dart';
// import 'admin/admin_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();

  void _login() async {
    try {
      Map<String, dynamic> loginData = await _apiService.login(
        _usernameController.text,
        _passwordController.text,
      );
      if (loginData['id_level'] == 5) { // Mahasiswa
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MahasiswaHome(
              periodeTahun: loginData['periode_tahun'].toString(),
              jamAlpha: double.parse(loginData['jam_alpha'].toString()),
              jamKompen: double.parse(loginData['jam_kompen'].toString()),
              jamKompenSelesai: double.parse(loginData['jam_kompen_selesai'].toString()),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login berhasil, tetapi bukan mahasiswa')),
        );
      }
    } catch (e) {
      print('Login gagal: ');
      // Show SnackBar with a red background color
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Login gagal: Masukkan Password atau Username Yang Benar',
            style: TextStyle(
                color: Colors
                    .white), // Make the text color white for better contrast
          ),
          backgroundColor: Colors.red, // Red color for error
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              Image.asset('assets/jti_logo.png', height: 100.0), // Ganti dengan logo kampus Anda
              const SizedBox(height: 20.0),
              const Text(
                'SISTEM INFORMASI',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFB800),
                ),
              ),
              const Text(
                'SISTEM KOMPENSASI',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: const Icon(Icons.person, color: Color(0xFFFFB800)),
                    filled: true,
                    fillColor: const Color(0xFFFFF9E7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock, color: Color(0xFFFFB800)),
                    suffixIcon: const Icon(Icons.visibility_off, color: Color(0xFFFFB800)),
                    filled: true,
                    fillColor: const Color(0xFFFFF9E7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB800),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'MASUK',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  
}
