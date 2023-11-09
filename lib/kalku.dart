import 'package:coba/dashboard.dart';
import 'package:flutter/material.dart';




class Kalku extends StatefulWidget {
  const Kalku({Key? key}) : super(key: key);

  @override
  _KalkuState createState() => _KalkuState();
}

class _KalkuState extends State<Kalku> {
  final TextEditingController controllera = TextEditingController();
  final TextEditingController controllerb = TextEditingController();
  final TextEditingController controllerhasil = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kalkulator'),
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
          width: double.infinity,
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
                    labelText: 'Bilangan A',
                  ),
                ),
                Container(
                  height: 45,
                ),
                TextField(
                  controller: controllerb,
                  decoration: InputDecoration(
                    labelText: 'Bilangan B',
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
                onPressed: (){
                 String a = controllera.text;
                 String b = controllerb.text;
                 double dA = double.parse(a);
                 double dB = double.parse(b);
                 double hasil = dA + dB;
                 controllerhasil.text =hasil.toString();
                },
                child: Text('Tambah'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        )
                    )
                ),
                  onPressed: (){
                    String a = controllera.text;
                    String b = controllerb.text;
                    double dA = double.parse(a);
                    double dB = double.parse(b);
                    double hasil = dA - dB;
                    controllerhasil.text =hasil.toString();
                  },
                child: Text('Kurang'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        )
                    )
                ),
                onPressed: (){
                    String a = controllera.text;
                    String b = controllerb.text;
                    double dA = double.parse(a);
                    double dB = double.parse(b);
                    double hasil = dA / dB;
                    controllerhasil.text =hasil.toString();
                  },
                child: Text('Bagi'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        )
                    )
                ),
                onPressed: (){
                    String a = controllera.text;
                    String b = controllerb.text;
                    double dA = double.parse(a);
                    double dB = double.parse(b);
                    double hasil = dA * dB;
                    controllerhasil.text =hasil.toString();
                  },
                child: Text('Kali'),
              ),
            ],
          ),
                TextField(
                  controller: controllerhasil,
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: 'Jawaban',
                  ),
                ),
                Container(
                  height: 45,
                ),
            ],
          ),
        )
      )
    );
  }
}
