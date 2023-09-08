import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todosapp/layout/home_screen.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startSplashViewTime() {
    _timer = Timer(const Duration(seconds: 3),
        _navigateToHome);
  }

  void _navigateToHome() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>const HomeScreen()));
  }


  @override
  void initState() {
    super.initState();
    _startSplashViewTime();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,

      body: Center(child: Image.asset("assets/images/1463.png")),
    );
  }


}

