import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String? idMahasiswa;
  String? nomorInduk;
  String? username;
  String? nama;
  String? periodeTahun;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nomorInduk = prefs.getString('nomor_induk');
      username = prefs.getString('username');
      nama = prefs.getString('nama');
      periodeTahun = prefs.getString('periode_tahun');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun Pribadi'),
        backgroundColor: Color(0xFFFFD700),
      ),
      body: SafeArea(
        child: SingleChildScrollView(  // Wrap the content with SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(height: 24.0),
                _buildInfoCard('Nomor Induk', nomorInduk),
                _buildInfoCard('Username', username),
                _buildInfoCard('Nama', nama),
                _buildInfoCard('Periode Tahun', periodeTahun),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[300],
            child: Icon(
              Icons.person,
              size: 60,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 12),
          Text(
            nama ?? 'Nama Tidak Tersedia',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            username ?? 'Username Tidak Tersedia',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String label, String? value) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: Icon(
          Icons.info_outline,
          color: Color(0xFFFFD700),
        ),
        title: Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          value ?? 'Tidak Tersedia',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
