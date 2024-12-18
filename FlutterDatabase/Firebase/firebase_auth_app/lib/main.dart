import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth_page.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

ThemeData colorTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xfff6f6f6),
  primaryColor: Colors.white,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    theme: colorTheme,
     home: SplashScr());
  }
}



class SplashScr extends StatefulWidget {
  const SplashScr({super.key});

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final user = auth.currentUser;
    Timer(const Duration(seconds: 3), () {
      if (user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Home()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/splash.jpg"),
            const SizedBox(height: 20),
            const Text(
              "Flutter x Firebase",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const CircularProgressIndicator(
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}

