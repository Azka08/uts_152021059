import 'package:coba/dashboard.dart';
import 'package:coba/home.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(Profile());
// }

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  void elevatedButtonDitekan(){
    print("Button Elevated Ditekan");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Pengguna'),
        foregroundColor: Colors.orange,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Dashboard(), // Ganti dengan nama halaman beranda Anda
              ),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(
                  'assets/profile.jpg' ,// Ganti dengan URL gambar Anda
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Nama Pengguna',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20), // Tambahkan jarak antara elemen-elemen
              TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              Container(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              Container(
                height: 25,
              ),
              TextField(
                obscureText: true, // Agar password tersembunyi
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              Container(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Usia',
                ),
              ),
              Container(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Gender',
                ),
              ),
              Container(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'No Telp',
                ),
              ),
              Container(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: elevatedButtonDitekan,
                    child: Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
