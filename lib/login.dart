// import 'package:flutter/material.dart';
// import 'api/api_service.dart';
// import 'dosen/dosen_home.dart';
// import 'mahasiswa/mahasiswa_home.dart';
// import 'admin/admin_home.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final ApiService apiService = ApiService();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

// Future<void> handleLogin() async {
//   try {
//     int level_id = await apiService.login(
//       usernameController.text,
//       passwordController.text,
//     );

//     if (level_id == 1) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const DosenHome()),
//       );
//     } else if (level_id == 2) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => MahasiswaHome()),
//       );
//     } else if (level_id == 3) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => AdminHome()),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Peran tidak dikenali")),
//       );
//     }
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Login gagal: $e")),
//     );
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Login")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: usernameController,
//               decoration: InputDecoration(labelText: "Username"),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: "Password"),
//               obscureText: true,
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: handleLogin,
//               child: Text("Login"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'api/api_service.dart';
import 'dosen/dosen_home.dart';
import 'mahasiswa/mahasiswa_home.dart';
import 'admin/admin_home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final ApiService apiService = ApiService();

  Future<void> _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    try {
      // Attempt to login using the API
      int level_id = await apiService.login(username, password);

      if (level_id == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DosenHome()),
        );
      } else if (level_id == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MahasiswaHome()),
        );
      } else if (level_id == 3) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AdminHome()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Peran tidak dikenali"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login gagal: $e"),
          backgroundColor: Colors.red,
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
                'MANAJEMEN DOSEN',
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
