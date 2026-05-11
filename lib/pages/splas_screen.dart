import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_uas/pages/login_page.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  late Timer ti;
  @override
   void initState() {
     // TODO: implement initState\

     ti = Timer.periodic(
       Duration(milliseconds: 3000),
       (timer) => Navigator.pushReplacement(
         context,
         MaterialPageRoute(builder: (context) => LoginPage()),
       ),
     );
     super.initState();
   }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.white,
              Colors.white,
              Colors.lightBlueAccent,
            ],radius: 0.8,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 325,
              child: Image.asset("aset/awa/logg.png", width: 520, height: 520),
            ),
          ],
        ),
      ),
    );
  }
}
