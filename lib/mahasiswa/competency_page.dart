import 'package:flutter/material.dart';
import 'package:mobile_dosen/api/api_service.dart';  // Import ApiService

class CompetencyPage extends StatefulWidget {
  @override
  _CompetencyPageState createState() => _CompetencyPageState();
}

class _CompetencyPageState extends State<CompetencyPage> {
  List<dynamic> competencies = [];  // Menyimpan data kompetensi
  bool isLoading = true;           // Menandakan status loading

  @override
  void initState() {
    super.initState();
    fetchCompetencies();  // Memanggil fungsi untuk mengambil data kompetensi
  }

  // Mengambil data kompetensi dari API menggunakan ApiService
  Future<void> fetchCompetencies() async {
    try {
      final fetchedCompetencies = await ApiService.fetchCompetencies();  // Memanggil fungsi dari ApiService

      // Memfilter kompetensi yang statusnya 'setuju'
      final filteredCompetencies = fetchedCompetencies.where((competency) {
        return competency['status'] == 'setuju';  // Hanya ambil kompetensi dengan status 'setuju'
      }).toList();

      setState(() {
        competencies = filteredCompetencies;  // Menyimpan data kompetensi yang sudah difilter
        isLoading = false;  // Update status loading
      });
    } catch (e) {
      print('Error fetching competencies: $e');
      setState(() {
        isLoading = false;  // Update status loading jika terjadi error
      });
    }
  }

  // Fungsi untuk menampilkan dialog dengan detail kompetensi
  void showDetailDialog(Map<String, dynamic> competency) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detail Kompen'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nomor Kompen: ${competency['nomor_kompen']}'),
              SizedBox(height: 8),
              Text('Nama Kompen: ${competency['nama']}'),
              SizedBox(height: 8),
              Text('Deskripsi Kompen: ${competency['deskripsi']}'),
              SizedBox(height: 8),
              Text('Kuota: ${competency['kuota']}'),
              SizedBox(height: 8),
              Text('Jam Kompen: ${competency['jam_kompen']}'),
              SizedBox(height: 8),
              Text('Status: ${competency['status']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();  // Menutup dialog
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  // Menjaga alignment ke kiri
          children: [
            // Judul Kompetensi di sebelah kiri
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Cari Tugas Kompen',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFD700), // Warna kuning
                ),
              ),
            ),
            
            // Menampilkan loading indicator saat data sedang dimuat
            isLoading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: competencies.length,
                      itemBuilder: (context, index) {
                        final competency = competencies[index];
                        return Card(
                          elevation: 4,
                          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.yellow[50],  // Warna latar belakang item yang lebih terang
                              boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 6.0)],
                            ),
                            child: ListTile(
                              leading: Icon(Icons.category, color: Colors.yellow[700], size: 40),
                              title: Text(
                                competency['nama'],  // Nama kompetensi
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                              ),
                              subtitle: Text(
                                competency['deskripsi'],  // Deskripsi kompetensi
                                style: TextStyle(color: Colors.grey),
                              ),
                              trailing: IconButton(
  icon: Icon(
                                  Icons
                                      .info_outline, // Menggunakan ikon 'i' dengan outline
                                  color: Colors
                                      .yellow[700], // Warna ikon kuning gelap
                                  size: 28, // Ukuran ikon lebih proporsional
                                ),
                                onPressed: () => showDetailDialog(
                                    competency), // Memanggil fungsi detail popup
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
