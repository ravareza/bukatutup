import 'package:flutter/material.dart';

class FashFood extends StatefulWidget {
  const FashFood({super.key});

  @override
  State<FashFood> createState() => _FashFoodState();
}

class _FashFoodState extends State<FashFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fashfood")),
      body: Center(child: Text("Coming Soon")),
    );
  }
}
