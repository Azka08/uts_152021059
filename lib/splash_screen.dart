import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:coba/aplikasi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Image.asset('assets/book2.png'),
          Column(
            children: [
              Text(
                'My First APK',
                style: GoogleFonts.acme(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow),
              ),
              Text(
                  'Aplikasi Pertama yang telah dibuat',
                  style: GoogleFonts.acme(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.black,
      nextScreen: Aplikasi(),
      splashIconSize: 250,
      duration: 3000,
      splashTransition: SplashTransition.slideTransition,
      //pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}