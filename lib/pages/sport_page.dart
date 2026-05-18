import 'package:flutter/material.dart';

class SportPage extends StatefulWidget {
  const SportPage({super.key});

  @override
  State<SportPage> createState() => _SportPageState();
}

class _SportPageState extends State<SportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sport")),
      body: Center(child: Text("Coming Soon")),
    );
  }
}
