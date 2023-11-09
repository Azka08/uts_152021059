import 'package:coba/dashboard.dart';
import 'package:coba/home.dart';
import 'package:coba/registrasi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Aplikasi());
}

class Aplikasi extends StatefulWidget {
  const Aplikasi({Key? key}) : super(key: key);

  @override
  _AplikasiState createState() => _AplikasiState();
}

class _AplikasiState extends State<Aplikasi> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void showLoginFailedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Login Gagal'),
          content: Text('Login gagal! Periksa kembali username dan password.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login'),
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

                // Validasi login
                if (registeredUsers.containsKey(username) &&
                    registeredUsers[username] == password) {
                  ScaffoldMessenger.of(context).showSnackBar(

                    SnackBar(
                      content: Text('Login berhasil!'),
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  );
                } else {
                  showLoginFailedDialog();
                }
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Registrasi(),
                  ),
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

// Simpan data pendaftaran dalam variabel global (untuk keperluan contoh)
Map<String, String> registeredUsers = {};