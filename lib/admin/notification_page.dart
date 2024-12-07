import 'package:flutter/material.dart';
import 'settings_page.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String _currentFilter = 'newest';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NOTIFIKASI',
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter tabs
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterTab(
                  title: 'Terbaru',
                  isSelected: _currentFilter == 'newest',
                  onTap: () => setState(() => _currentFilter = 'newest'),
                ),
                FilterTab(
                  title: 'Terlama',
                  isSelected: _currentFilter == 'oldest',
                  onTap: () => setState(() => _currentFilter = 'oldest'),
                ),
                FilterTab(
                  title: 'Semua',
                  isSelected: _currentFilter == 'all',
                  onTap: () => setState(() => _currentFilter = 'all'),
                ),
              ],
            ),
          ),
          // Notification cards
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Adjust this to the actual count
              itemBuilder: (context, index) {
                return NotificationCard(
                  title: index == 1 ? 'Dari Pak Enggar' : 'Dari Mahasiswa',
                  subtitle: index == 1
                      ? 'Pengajuan Membuat Tugas anda baru'
                      : 'Pengajuan Verifikasi Tugas yang telah diker...',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FilterTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  FilterTab({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isSelected)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 4,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }
}


class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;

  NotificationCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.amber.shade100,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded( // Membuat teks menyesuaikan lebar
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                    overflow: TextOverflow.ellipsis, // Menambahkan ellipsis jika teks terlalu panjang
                  ),
                ],
              ),
            ),
            SizedBox(width: 10), // Memberi jarak antara teks dan tombol "Lihat"
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text(
                'Lihat',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
