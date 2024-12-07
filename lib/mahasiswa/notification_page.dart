import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'NOTIFIKASI',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFD700),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      _buildTabButton('Terbaru', true),
                      SizedBox(width: 10.0),
                      _buildTabButton('Terlama', false),
                      SizedBox(width: 10.0),
                      _buildTabButton('Semua', false),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                children: [
                  _buildNotificationItem(
                    'Dari Admin',
                    'Pengajuan tugas anda baru saya di setujui',
                    DateTime.now(),
                  ),
                  _buildNotificationItem(
                    'Dari Pak Enggar',
                    'Pengajuan tugas anda baru saya di setujui',
                    DateTime.now().subtract(Duration(hours: 2)),
                  ),
                  _buildNotificationItem(
                    'Dari Pak Subehiy',
                    'Pengajuan tugas anda baru saya di setujui',
                    DateTime.now().subtract(Duration(hours: 3)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Kompetensi'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifikasi'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Pengaturan'),
        ],
        currentIndex: 2,
        selectedItemColor: Color(0xFFFFD700),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildTabButton(String text, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF1A237E) : Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: isSelected ? Color(0xFF1A237E) : Colors.grey,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildNotificationItem(String title, String message, DateTime time) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFFFF8E1),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Lihat',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}