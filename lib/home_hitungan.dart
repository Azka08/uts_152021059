import 'package:coba/bmi.dart';
import 'package:coba/kalku.dart';
import 'package:coba/konv_suhu.dart';
import 'package:coba/konv_uang.dart';
import 'package:coba/konversi_waktu.dart';
import 'package:coba/nilai.dart';
import 'package:flutter/material.dart';

class HomeHitungan extends StatefulWidget {
  const HomeHitungan({Key? key}) : super(key: key);

  @override
  _HomeHitunganState createState() => _HomeHitunganState();
}

class _HomeHitunganState extends State<HomeHitungan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Aplikasi Perhitungan'),
          foregroundColor: Colors.orange,
          backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.calculate_outlined),
              title: Text('Kalkulator'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Kalku(), // Ganti dengan nama halaman beranda Anda
                    )
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('Konversi Suhu'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => KonvSuhu(), // Ganti dengan nama halaman beranda Anda
                )
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.money),
              title: Text('Konversi Uang'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KonvUang(), // Ganti dengan nama halaman beranda Anda
                    )
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.monitor_weight),
              title: Text('BMI'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Bmi(), // Ganti dengan nama halaman beranda Anda
                    )
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.score),
              title: Text('Nilai'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Nilai(), // Ganti dengan nama halaman beranda Anda
                    )
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.timelapse),
              title: Text('Waktu'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const KonversiWaktu(), // Ganti dengan nama halaman beranda Anda
                    )
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
