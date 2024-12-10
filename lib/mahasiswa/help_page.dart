import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bantuan'),
        backgroundColor: const Color(0xFFFFD700),
        elevation: 0, // Menghilangkan bayangan agar tampak lebih bersih
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0), // Padding lebih proporsional
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Heading yang lebih menonjol
              Text(
                'Pusat Bantuan',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 16.0), // Memberikan ruang setelah judul

              // Informasi bantuan dengan penjelasan lebih detail
              Text(
                'Jika Anda mengalami masalah atau membutuhkan bantuan, kami siap membantu '
                'Anda. Silakan pilih salah satu opsi berikut untuk memulai:',
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.5, // Mengatur jarak antar baris agar teks lebih mudah dibaca
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 20.0), // Memberikan ruang antar paragraf dan daftar
              
              // Daftar opsi bantuan dengan icon untuk memberi tampilan interaktif
              HelpOption(
                icon: Icons.phone_in_talk,
                title: 'Hubungi Layanan Pelanggan',
                description: 'Jika Anda membutuhkan bantuan langsung, hubungi kami di nomor '
                    'layanan pelanggan.',
              ),
              HelpOption(
                icon: Icons.book,
                title: 'Panduan Pengguna',
                description: 'Baca panduan pengguna kami untuk solusi lengkap dan tips '
                    'menggunakan aplikasi.',
              ),
              HelpOption(
                icon: Icons.help_outline, // Ganti dengan ikon yang benar
                title: 'FAQ',
                description: 'Periksa pertanyaan yang sering diajukan untuk bantuan cepat.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HelpOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  HelpOption({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        elevation: 4.0, // Memberikan efek bayangan pada card agar lebih menarik
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Membuat sudut card lebih lembut
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.amber, size: 30.0), // Ikon di samping judul
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black54,
            ),
          ),
          onTap: () {
            // Fungsi untuk membuka lebih lanjut jika diperlukan, misalnya menampilkan halaman baru
          },
        ),
      ),
    );
  }
}
