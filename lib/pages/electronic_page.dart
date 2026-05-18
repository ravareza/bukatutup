import 'package:flutter/material.dart';

class ElectronicPage extends StatefulWidget {
  const ElectronicPage({super.key});

  @override
  State<ElectronicPage> createState() => _ElectronicPageState();
}

class _ElectronicPageState extends State<ElectronicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Electronic")),
      body: Center(child: Text("Coming Soon")),
    );
  }
}
