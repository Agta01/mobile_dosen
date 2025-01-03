import 'package:flutter/material.dart';
import 'tasks.dart';
import 'notifications.dart';
import 'settings.dart';

class DosenHome extends StatefulWidget {
  const DosenHome({super.key});

  @override
  State<DosenHome> createState() => _DosenHomeState();
}

class _DosenHomeState extends State<DosenHome> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const TasksScreen(),
    const NotificationsScreen(),
    const SettingsScreen(),  // SettingsScreen includes logout function to navigate to LoginPage
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Tugas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFFD700),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
