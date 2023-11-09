import 'package:coba/aplikasi.dart';
import 'package:flutter/material.dart';

// void main(){
//   runApp(Registrasi());
// }

class Registrasi extends StatefulWidget {
  const Registrasi({super.key});

  @override
  _RegistrasiState createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Registrasi'),
        foregroundColor: Colors.orange,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final String username = usernameController.text;
                final String password = passwordController.text;

                // Validasi input
                if (username.isNotEmpty && password.isNotEmpty) {
                  // Simpan username dan password (bisa juga disimpan ke database)
                  // Untuk sederhananya, kita simpan dalam variabel global.
                  registeredUsers[username] = password;

                  // Pindah ke layar login
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Aplikasi(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Harap isi semua field!'),
                    ),
                  );
                }
              },
              child: Text('Daftar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Aplikasi(),
                  ),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}