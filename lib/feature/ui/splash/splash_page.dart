import 'dart:async';

import 'package:flutter/material.dart';

import '../../ui/main/main_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _startSplashPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Welcome to Flutter App',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 16.0),
              FlutterLogo(size: 120),
              SizedBox(height: 16.0),
              CircularProgressIndicator(color: Colors.white),
            ]),
      ),
    );
  }

  _startSplashPage() {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () => _goToMainPage(context));
  }

  _goToMainPage(context) {
    final route = MaterialPageRoute(builder: (context) => const MainPage());
    Navigator.pushReplacement(context, route);
  }
}
