import 'package:flutter/material.dart';
import 'package:project_uas/models/product_model.dart';
import 'package:project_uas/services/product_list.dart';

class DetProduct extends StatefulWidget {
  final int id;
  const DetProduct({super.key, required this.id});

  @override
  State<DetProduct> createState() => _DetProductState();
}

class _DetProductState extends State<DetProduct> {
late ProductModel product;
  @override
  void initState() {
    final product = pro.firstWhere((element) => element.id == widget.id,);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(decoration: BoxDecoration(color: Colors.lightBlueAccent
            ),),
          ),body: Column(
          children: [Container(
    width: double.infinity,
    height: 150,
    alignment: Alignment.center,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage(product.img),
    fit: BoxFit.fill,)

    )
    ),
        ]),
    );
  }
}
