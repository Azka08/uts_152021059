import 'package:coba/aplikasi.dart';
import 'package:flutter/material.dart';
import 'package:coba/profile.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void navigateToProfile() {
    // Navigasi ke halaman profil
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Profile()),
    );
  }

  void showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Logout'),
          content: Text('Anda yakin ingin logout?'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Aplikasi(),
                ),
              );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi'),
          foregroundColor: Colors.orange,
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.account_circle_outlined, // Ganti dengan ikon profil yang Anda inginkan
                color: Colors.yellow, // Ganti dengan warna ikon yang sesuai
              ),
              onPressed: navigateToProfile, // Mengarahkan ke halaman profil saat ikon profil diklik
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                color: Colors.amber,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.indigoAccent,
                        child: Center(child: Text(index.toString())),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 125,
                color: Colors.red,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 125,
                color: Colors.blueAccent,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 125,
                color: Colors.green,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 125,
                color: Colors.brown,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 125,
                color: Colors.greenAccent,
              ),
              // Tambahkan DataCuaca() di sini jika Anda ingin menggunakannya.
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Nama Pengguna"), // Ganti dengan nama pengguna
                accountEmail: Text("email@example.com"), // Ganti dengan email pengguna
                currentAccountPicture: CircleAvatar(
                  // Ganti dengan gambar profil pengguna
                  backgroundImage: AssetImage(
                    'assets/profile.jpg' ,// Ganti dengan URL gambar Anda
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: () {
                  showLogoutConfirmationDialog(); // Menampilkan dialog konfirmasi logout
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}
