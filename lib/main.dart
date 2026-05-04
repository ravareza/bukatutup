import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_uas/pages/splas_screen.dart';

void main(){
  runApp(Main());
}
class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplasScreen(),debugShowCheckedModeBanner: false,);
  }
}
