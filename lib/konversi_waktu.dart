import 'package:coba/dashboard.dart';
import 'package:flutter/material.dart';

class KonversiWaktu extends StatefulWidget {
  const KonversiWaktu({Key? key}) : super(key: key);

  @override
  _KonversiWaktuState createState() => _KonversiWaktuState();
}

class _KonversiWaktuState extends State<KonversiWaktu> {
  int totalMinutes = 0;
  int days = 0;
  int hours = 0;
  int minutes = 0;

  void convertTime() {
    setState(() {
      days = totalMinutes ~/ (24 * 60);
      hours = (totalMinutes % (24 * 60)) ~/ 60;
      minutes = totalMinutes % 60;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Waktu'),
        foregroundColor: Colors.orange,
        backgroundColor: Colors.black,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_rounded), // Menggunakan 'Icon()' untuk menambahkan ikon.
        //   onPressed: () {
        //     Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => Dashboard(), // Ganti dengan nama halaman beranda Anda
        //       ),
        //     );
        //   },
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Total Menit'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  totalMinutes = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convertTime,
              child: Text('Konversi'),
            ),
            SizedBox(height: 20),
            Text('Hasil Konversi:'),
            Text('Hari: $days'),
            Text('Jam: $hours'),
            Text('Menit: $minutes'),
          ],
        ),
      ),
    );
  }
}