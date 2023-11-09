import 'package:coba/biodata.dart';
import 'package:coba/home_hitungan.dart';
import 'package:coba/home.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Dashboard());
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.black,
        items:<Widget> [
            Icon(
              Icons.home,
              color: Colors.orange,
            ),
          Icon(
              Icons.calculate,
              color: Colors.orange,
            ),
          Icon(
              Icons.account_circle,
              color: Colors.orange,
            ),
        ],
        index: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: <Widget>[
        Home(),
        HomeHitungan(),
        Biodata(),
      ][currentIndex],
    );
  }
}
