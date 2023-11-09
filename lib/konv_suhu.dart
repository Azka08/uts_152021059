import 'package:coba/dashboard.dart';
import 'package:coba/home_hitungan.dart';
import 'package:flutter/material.dart';

class KonvSuhu extends StatefulWidget {
  const KonvSuhu({Key? key}) : super(key: key);

  @override
  _KonvSuhuState createState() => _KonvSuhuState();
}

class _KonvSuhuState extends State<KonvSuhu> {
  TextEditingController celsiusController = TextEditingController();
  TextEditingController fahrenheitController = TextEditingController();
  String selectedTemperatureFrom = '°C'; // Suhu awal
  String selectedTemperatureTo = '°F'; // Suhu tujuan

  double convertTemperature(double temperature, String from, String to) {
    if (from == '°C' && to == '°F') {
      return (temperature * 9/5) + 32;
    } else if (from == '°F' && to == '°C') {
      return (temperature - 32) * 5/9;
    } else {
      return temperature;
    }
  }

  void konversiSuhu() {
    double? celsius = double.tryParse(celsiusController.text) ?? 0;
    double fahrenheit = convertTemperature(celsius, selectedTemperatureFrom, selectedTemperatureTo);
    fahrenheitController.text = fahrenheit.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Suhu'),
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
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: celsiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Suhu (°C)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.wb_sunny),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: selectedTemperatureFrom,
                  items: ['°C', '°F'].map((String temperature) {
                    return DropdownMenuItem<String>(
                      value: temperature,
                      child: Text(temperature),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTemperatureFrom = newValue ?? '°C';
                    });
                  },
                ),
                Icon(Icons.arrow_forward),
                DropdownButton<String>(
                  value: selectedTemperatureTo,
                  items: ['°C', '°F'].map((String temperature) {
                    return DropdownMenuItem<String>(
                      value: temperature,
                      child: Text(temperature),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTemperatureTo = newValue ?? '°F';
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                konversiSuhu();
              },
              child: Text('Konversi', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: fahrenheitController,
              keyboardType: TextInputType.number,
              enabled: false,
              decoration: InputDecoration(
                labelText: 'Hasil Konversi',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.wb_sunny),
              ),
            ),
          ],
        ),
      ),
    );
  }
}