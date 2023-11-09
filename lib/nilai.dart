import 'package:flutter/material.dart';

class Nilai extends StatefulWidget {
  const Nilai({Key? key}) : super(key: key);

  @override
  _NilaiState createState() => _NilaiState();
}

class _NilaiState extends State<Nilai> {
  double uts = 0.0;
  double uas = 0.0;
  double tugas1 = 0.0;
  double tugas2 = 0.0;
  double nilaiAkhir = 0.0;
  String indeks = '';

  void calculateValue() {
    // Hitung nilai akhir dengan bobot masing-masing komponen
    nilaiAkhir = (uts * 0.3) + (uas * 0.3) + (tugas1 * 0.2) + (tugas2 * 0.2);

    if (nilaiAkhir >= 80) {
      indeks = 'A';
    } else if (nilaiAkhir >= 70) {
      indeks = 'B';
    } else if (nilaiAkhir >= 60) {
      indeks = 'C';
    } else if (nilaiAkhir >= 50) {
      indeks = 'D';
    } else {
      indeks = 'E';
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nilai Index'),
        foregroundColor: Colors.orange,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Nilai UTS'),
            onChanged: (value) {
              uts = double.tryParse(value) ?? 0.0;
            },
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: 'Nilai UAS'),
            onChanged: (value) {
              uas = double.tryParse(value) ?? 0.0;
            },
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: 'Nilai Tugas 1'),
            onChanged: (value) {
              tugas1 = double.tryParse(value) ?? 0.0;
            },
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(labelText: 'Nilai Tugas 2'),
            onChanged: (value) {
              tugas2 = double.tryParse(value) ?? 0.0;
            },
          ),
          SizedBox(height: 45),
          ElevatedButton(
            onPressed: calculateValue,
            child: Text('Hitung Nilai dan Indeks'),
          ),
          SizedBox(height: 20),
          Text('Nilai Akhir: $nilaiAkhir'),
          SizedBox(height: 15),
          Text('Indeks Nilai: $indeks'),
        ],
      ),
    );
  }
}
