import 'package:flutter/material.dart';
import 'competency_page.dart';
import 'notification_page.dart';
import 'settings_page.dart';
import 'package:fl_chart/fl_chart.dart';

class MahasiswaHome extends StatefulWidget {
  final String periodeTahun;
  final double jamAlpha;
  final double jamKompen;
  final double jamKompenSelesai;

  const MahasiswaHome({
    Key? key,
    this.periodeTahun = '',
    this.jamAlpha = 0.0,
    this.jamKompen = 0.0,
    this.jamKompenSelesai = 0.0,
  }) : super(key: key);

  @override
  _MahasiswaHomeState createState() => _MahasiswaHomeState();
}

class _MahasiswaHomeState extends State<MahasiswaHome> {
  int _selectedIndex = 0; // Index untuk bottom navigation

  // Daftar halaman untuk IndexedStack, tanpa Dashboard pada index pertama
  final List<Widget> _pages = [
    Container(),  // Empty container for Dashboard (we'll manually show dashboard info in the body)
    CompetencyPage(),
    NotificationPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _selectedIndex == 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'DASHBOARD',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFD700),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildAttendanceCard(
                          'Periode Tahun',
                          widget.periodeTahun,
                          Colors.green,
                        ),
                        _buildAttendanceCard(
                          'Jam Alpa',
                          '${widget.jamAlpha} Jam',
                          Colors.blue,
                        ),
                        _buildAttendanceCard(
                          'Jam Kompen',
                          '${widget.jamKompen} Jam',
                          Colors.red,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    // Updated Bar Chart for comparing jamKompen vs jamKompenSelesai
                    const SizedBox(height: 20.0),
                    // Updated Bar Chart for comparing jamKompen vs jamKompenSelesai
                    Container(
                      height: 250.0,
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BarChart(
                          BarChartData(
                            alignment: BarChartAlignment.spaceAround,
                            maxY: 20, // Set this based on your data range
                            barGroups: [
                              BarChartGroupData(
                                x: 0, // Represents "Kompen"
                                barRods: [
                                  BarChartRodData(
                                    toY: widget.jamKompen,
                                    color: Colors.blue,
                                    width: 15,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ],
                              ),
                              BarChartGroupData(
                                x: 1, // Represents "Kompen Selesai"
                                barRods: [
                                  BarChartRodData(
                                    toY: widget.jamKompenSelesai,
                                    color: Colors.green,
                                    width: 15,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ],
                              ),
                            ],
                            titlesData: FlTitlesData(
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                    showTitles: false), // Hide left axis labels
                              ),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget:
                                      (double value, TitleMeta meta) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        value == 0
                                            ? 'Kompen'
                                            : 'Kompen Selesai',
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              topTitles: AxisTitles(
                                // Hide top axis labels
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                            borderData: FlBorderData(show: true),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                )
              : _pages[_selectedIndex], // Show the corresponding page based on selected index
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Kompetensi'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifikasi'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Pengaturan'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFFD700),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped, // Fungsi untuk menangani klik
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  // Fungsi untuk menanggapi klik tombol bottom navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update index yang dipilih
    });
  }

  // Widget untuk membuat card attendance
  Widget _buildAttendanceCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 5.0),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
