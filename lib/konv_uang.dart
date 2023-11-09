import 'package:coba/dashboard.dart';
import 'package:flutter/material.dart';

class KonvUang extends StatefulWidget {
  const KonvUang({Key? key}) : super(key: key);

  @override
  _KonvUangState createState() => _KonvUangState();
}

class _KonvUangState extends State<KonvUang> {
  TextEditingController nominalController = TextEditingController();
  double result = 0;
  String selectedCurrencyFrom = 'USD'; // Mata uang awal
  String selectedCurrencyTo = 'IDR'; // Mata uang tujuan

  Map<String, Map<String, double>> conversionRates = {
    'USD': {
      'IDR': 14142.85, // 1 USD = 14,142.85 IDR
      'MYR': 3.77123,  // 1 USD = 3.77123 MYR
      'SGD': 1.33678, // 1 USD = 1.33678 SGD
      'JPY': 109.58,  // 1 USD = 109.58 JPY
      'KRW': 1197.08,  // 1 USD = 1197.08 KRW
    },
    'MYR': {
      'IDR': 3371.00,  // 1 MYR = 3,371.00 IDR
      'USD': 0.26530,  // 1 MYR = 0.26530 USD
    },
    'SGD': {
      'IDR': 10406.25, // 1 SGD = 10,406.25 IDR
      'USD': 0.74752,  // 1 SGD = 0.74752 USD
    },
    'JPY': {
      'IDR': 110.20,  // 1 JPY = 110.20 IDR
      'USD': 0.00911,  // 1 JPY = 0.00911 USD
    },
    'KRW': {
      'IDR': 115.59,  // 1 KRW = 115.59 IDR
      'USD': 0.00083,  // 1 KRW = 0.00083 USD
    },
    'IDR': {
      'USD': 0.000071,  // 1 IDR = 0.000071 USD
      'MYR': 0.000297, // 1 IDR = 0.000297 MYR
      'SGD': 0.000096, // 1 IDR = 0.000096 SGD
      'JPY': 0.009070, // 1 IDR = 0.009070 JPY
      'KRW': 0.086389, // 1 IDR = 0.086389 KRW
    },
  };

  double convertCurrency(double nominal, String from, String to) {
    return nominal * (conversionRates[from]![to] ?? 1.0);
  }

  void konversiUang() {
    double? nominal = double.tryParse(nominalController.text) ?? 0;
    result = convertCurrency(nominal, selectedCurrencyFrom, selectedCurrencyTo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Uang'),
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
              controller: nominalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nominal',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: selectedCurrencyFrom,
                  items: conversionRates.keys.map((String currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCurrencyFrom = newValue ?? 'USD';
                    });
                  },
                ),
                Icon(Icons.arrow_forward),
                DropdownButton<String>(
                  value: selectedCurrencyTo,
                  items: conversionRates.keys.map((String currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCurrencyTo = newValue ?? 'IDR';
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                konversiUang();
                setState(() {});
              },
              child: Text('Konversi', style: TextStyle(color: Colors.white)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Hasil Konversi: $result $selectedCurrencyTo',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
