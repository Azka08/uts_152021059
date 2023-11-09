import 'dart:math';

import 'package:coba/dashboard.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  _BmiState createState() => _BmiState();
}



class _BmiState extends State<Bmi> {
  final TextEditingController controllera = TextEditingController();
  final TextEditingController controllerb = TextEditingController();
  final TextEditingController controllerhasil = TextEditingController();
  final TextEditingController controllerhasilloop =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text('BMI'),
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
            body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                      ),
                      TextField(
                        controller: controllera,
                        decoration: InputDecoration(
                          labelText: 'Tinggi Badan (Dalam cm)',
                        ),
                      ),
                      Container(
                        height: 45,
                      ),
                      TextField(
                        controller: controllerb,
                        decoration: InputDecoration(
                          labelText: 'Berat Badan (Dalam kg)',
                        ),
                      ),
                      Container(
                        height: 45,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    )
                                )
                            ),
                            onPressed: () {
                              String a = controllera.text;
                              String b = controllerb.text;
                              double dA = double.parse(a);
                              double dB = double.parse(b);
                              double DA = dA / 100;
                              double DAA = DA * DA;
                              double hasil = dB / DAA;

                              String hasilText;
                              if (hasil < 18.5) {
                                hasilText = 'Berat badan kurang';
                              } else if (hasil >= 18.5 && hasil < 24.9) {
                                hasilText = 'Berat badan Sehat';
                              } else if (hasil >= 24.9 && hasil < 30) {
                                hasilText = 'Berat badan berlebih';
                              } else
                                hasilText = 'Berat badan obesitas';


                              controllerhasilloop.text = hasilText.toString();
                              controllerhasil.text =hasil.toString();
                            },
                            child: Text('Hitung'),
                          ),
                        ],
                      ),
                      TextField(
                        controller: controllerhasil,
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: 'Hasil Hitungan',
                        ),
                      ),
                      TextField(
                        controller: controllerhasilloop,
                        enabled: false,
                        decoration: InputDecoration(
                          labelText: 'Kesimpulan Hitungan BMI',
                        ),
                      ),
                    ],
                  ),
                )
            )
        );
  }
}
