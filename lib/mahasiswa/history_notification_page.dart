// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import '../api/api_service.dart';

// // class HistoryNotificationPage extends StatefulWidget {
// //   @override
// //   _HistoryNotificationPageState createState() =>
// //       _HistoryNotificationPageState();
// // }

// // class _HistoryNotificationPageState extends State<HistoryNotificationPage> {
// //   List<dynamic> historiKompen = [];
// //   bool isLoading = true;

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchHistoriKompen();
// //   }

// //   Future<void> fetchHistoriKompen() async {
// //     try {
// //       SharedPreferences prefs = await SharedPreferences.getInstance();
// //       String? token = prefs.getString('token');
// //       String? idMahasiswa = prefs.getString('id_mahasiswa');

// //       if (token != null && idMahasiswa != null) {
// //         final data = await ApiService().fetchHistoriKompen(token, idMahasiswa);

// //         final filteredData = data.where((item) => item['id_mahasiswa'].toString() == idMahasiswa).toList();

// //         setState(() {
// //           historiKompen = filteredData;
// //           isLoading = false;
// //         });
// //       } else {
// //         throw Exception("Token atau ID Mahasiswa tidak ditemukan.");
// //       }
// //     } catch (e) {
// //       setState(() {
// //         isLoading = false;
// //       });
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text("Gagal memuat histori kompen: $e")),
// //       );
// //     }
// //   }

// //   void showDetailPopup(Map<String, dynamic> kompen) {
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: Text("Detail Kompen"),
// //           content: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               Text("Nama Kompen: ${kompen['kompen']['nama']}"),
// //               Text("Deskripsi: ${kompen['kompen']['deskripsi']}"),
// //               Text("Tanggal Mulai: ${kompen['kompen']['tanggal_mulai']}"),
// //               Text("Tanggal Selesai: ${kompen['kompen']['tanggal_selesai']}"),
// //               Text("Status: ${kompen['status']}"),
// //               Text("Progress 1: ${kompen['progres_1'] ?? 'Belum ada'}"),
// //               Text("Progress 2: ${kompen['progres_2'] ?? 'Belum ada'}"),
// //             ],
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () => Navigator.pop(context),
// //               child: Text("Tutup"),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Padding(
// //               padding: EdgeInsets.all(16.0),
// //               child: Text(
// //                 'History Kompen',
// //                 style: TextStyle(
// //                   fontSize: 24.0,
// //                   fontWeight: FontWeight.bold,
// //                   color: Color(0xFFFFD700),
// //                 ),
// //               ),
// //             ),
// //             isLoading
// //                 ? Center(child: CircularProgressIndicator())
// //                 : Expanded(
// //                     child: ListView.builder(
// //                       itemCount: historiKompen.length,
// //                       itemBuilder: (context, index) {
// //                         final item = historiKompen[index];
// //                         return Card(
// //                           elevation: 4,
// //                           margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(12.0),
// //                           ),
// //                           child: Container(
// //                             decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.circular(12.0),
// //                               color: Colors.yellow[50],
// //                               boxShadow: [
// //                                 BoxShadow(
// //                                   color: Colors.grey.withOpacity(0.2),
// //                                   blurRadius: 6.0,
// //                                 ),
// //                               ],
// //                             ),
// //                             child: ListTile(
// //                               leading: Icon(Icons.history, color: Colors.yellow[700], size: 40),
// //                               title: Text(
// //                                 item['kompen']['nama'] ?? 'Tidak ada nama',
// //                                 style: TextStyle(
// //                                   fontWeight: FontWeight.bold,
// //                                   fontSize: 16,
// //                                   color: Colors.black,
// //                                 ),
// //                               ),
// //                               subtitle: Text(
// //                                 "Status: ${item['status'] ?? 'Tidak ada status'}\n"
// //                                 "Tanggal: ${item['kompen']['tanggal_mulai'] ?? ''} - ${item['kompen']['tanggal_selesai'] ?? ''}",
// //                                 style: TextStyle(color: Colors.grey),
// //                               ),
// //                               trailing: ElevatedButton.icon(
// //                                 onPressed: () => showDetailPopup(item),
// //                                 style: ElevatedButton.styleFrom(
// //                                   backgroundColor: Colors.yellow[700],
// //                                   shape: RoundedRectangleBorder(
// //                                     borderRadius: BorderRadius.circular(30.0),
// //                                   ),
// //                                 ),
// //                                 icon: Icon(Icons.info_outline, color: Colors.white),
// //                                 label: Text('Baca Detail', style: TextStyle(color: Colors.white)),
// //                               ),
// //                             ),
// //                           ),
// //                         );
// //                       },
// //                     ),
// //                   ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../api/api_service.dart';

// class HistoryNotificationPage extends StatefulWidget {
//   @override
//   _HistoryNotificationPageState createState() =>
//       _HistoryNotificationPageState();
// }

// class _HistoryNotificationPageState extends State<HistoryNotificationPage> {
//   List<dynamic> historiKompen = [];
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchHistoriKompen();
//   }

//   Future<void> fetchHistoriKompen() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('token');
//       String? idMahasiswa = prefs.getString('id_mahasiswa');

//       if (token != null && idMahasiswa != null) {
//         final data = await ApiService().fetchHistoriKompen(token, idMahasiswa);

//         final filteredData = data.where((item) => item['id_mahasiswa'].toString() == idMahasiswa).toList();

//         setState(() {
//           historiKompen = filteredData;
//           isLoading = false;
//         });
//       } else {
//         throw Exception("Token atau ID Mahasiswa tidak ditemukan.");
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Gagal memuat histori kompen: $e")),
//       );
//     }
//   }

// void showDetailPopup(Map<String, dynamic> kompen) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: Text("Detail Kompen"),
//         content: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text("Nama Kompen: ${kompen['kompen']['nama']}"),
//               Text("Deskripsi: ${kompen['kompen']['deskripsi']}"),
//               Text("Tanggal Mulai: ${kompen['kompen']['tanggal_mulai']}"),
//               Text("Tanggal Selesai: ${kompen['kompen']['tanggal_selesai']}"),
//               Text("Status: ${kompen['status']}"),
//               Text("Progress 1: ${kompen['progres_1'] ?? 'Belum ada'}"),
//               Text("Progress 2: ${kompen['progres_2'] ?? 'Belum ada'}"),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text("Tutup"),
//           ),
//         ],
//       );
//     },
//   );
// }


//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontSize: 16.0,
//               fontWeight: FontWeight.bold,
//               color: Colors.black87,
//             ),
//           ),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 16.0,
//               color: Colors.grey[600],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Text(
//                 'History Kompen',
//                 style: TextStyle(
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFFFFD700),
//                 ),
//               ),
//             ),
//             isLoading
//                 ? Center(child: CircularProgressIndicator())
//                 : Expanded(
//                     child: ListView.builder(
//                       itemCount: historiKompen.length,
//                       itemBuilder: (context, index) {
//                         final item = historiKompen[index];
//                         return Card(
//                           elevation: 4,
//                           margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12.0),
//                           ),
//                           child: Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12.0),
//                               color: Colors.yellow[50],
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.2),
//                                   blurRadius: 6.0,
//                                 ),
//                               ],
//                             ),
//                             child: ListTile(
//                               leading: Icon(Icons.history, color: Colors.yellow[700], size: 40),
//                               title: Text(
//                                 item['kompen']['nama'] ?? 'Tidak ada nama',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                               subtitle: Text(
//                                 "Status: ${item['status'] ?? 'Tidak ada status'}\n"
//                                 "Tanggal: ${item['kompen']['tanggal_mulai'] ?? ''} - ${item['kompen']['tanggal_selesai'] ?? ''}",
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                               trailing: ElevatedButton.icon(
//                                 onPressed: () => showDetailPopup(item),
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.yellow[700],
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(30.0),
//                                   ),
//                                 ),
//                                 icon: Icon(Icons.info_outline, color: Colors.white),
//                                 label: Text('Baca Detail', style: TextStyle(color: Colors.white)),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/api_service.dart';

class HistoryNotificationPage extends StatefulWidget {
  @override
  _HistoryNotificationPageState createState() =>
      _HistoryNotificationPageState();
}

class _HistoryNotificationPageState extends State<HistoryNotificationPage> {
  List<dynamic> historiKompen = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchHistoriKompen();
  }

  Future<void> fetchHistoriKompen() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      String? idMahasiswa = prefs.getString('id_mahasiswa');

      if (token != null && idMahasiswa != null) {
        final data = await ApiService().fetchHistoriKompen(token, idMahasiswa);

        final filteredData = data.where((item) => item['id_mahasiswa'].toString() == idMahasiswa).toList();

        setState(() {
          historiKompen = filteredData;
          isLoading = false;
        });
      } else {
        throw Exception("Token atau ID Mahasiswa tidak ditemukan.");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Gagal memuat histori kompen: $e")),
      );
    }
  }

void showDetailPopup(Map<String, dynamic> kompen) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("Detail Kompen"),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Nama Kompen: ${kompen['kompen']['nama']}"),
              Text("Deskripsi: ${kompen['kompen']['deskripsi']}"),
              Text("Tanggal Mulai: ${kompen['kompen']['tanggal_mulai']}"),
              Text("Tanggal Selesai: ${kompen['kompen']['tanggal_selesai']}"),
              Text("Status: ${kompen['status']}"),
              Text("Progress 1: ${kompen['progres_1'] ?? 'Belum ada'}"),
              Text("Progress 2: ${kompen['progres_2'] ?? 'Belum ada'}"),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Tutup"),
          ),
        ],
      );
    },
  );
}


  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'History Kompen',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFFD700),
                ),
              ),
            ),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: historiKompen.length,
                      itemBuilder: (context, index) {
                        final item = historiKompen[index];
                        return Card(
                          elevation: 4,
                          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.yellow[50],
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 6.0,
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Icon(Icons.history, color: Colors.yellow[700], size: 40),
                              title: Text(
                                item['kompen']['nama'] ?? 'Tidak ada nama',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                  overflow: TextOverflow.ellipsis, // Memastikan teks tidak terpotong
                                ),
                                maxLines: 1, // Membatasi teks agar tidak lebih dari satu baris
                              ),
                              subtitle: Text(
                                "Status: ${item['status'] ?? 'Tidak ada status'}\n"
                                "Tanggal: ${item['kompen']['tanggal_mulai'] ?? ''} - ${item['kompen']['tanggal_selesai'] ?? ''}",
                                style: TextStyle(color: Colors.grey),
                                overflow: TextOverflow.ellipsis, // Menghindari teks terpotong
                                maxLines: 2, // Membatasi subtitle hingga dua baris
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons
                                      .info_outline, // Menggunakan ikon 'i' dengan outline
                                  color: Colors
                                      .yellow[700], // Warna ikon kuning gelap
                                  size: 28, // Ukuran ikon lebih proporsional
                                ),
                                onPressed: () => showDetailPopup(
                                    item), // Memanggil fungsi detail popup
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
