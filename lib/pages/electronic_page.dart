import 'package:flutter/material.dart';
import 'package:project_uas/services/product_list.dart';

import '../widgets/product_widget.dart';

class ElectronicPage extends StatefulWidget {
  const ElectronicPage({super.key});

  @override
  State<ElectronicPage> createState() => _ElectronicPageState();
}

class _ElectronicPageState extends State<ElectronicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Electronic",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
