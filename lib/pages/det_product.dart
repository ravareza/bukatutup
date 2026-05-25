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
    product = pro.firstWhere((element) => element.id == widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Colors.lightBlueAccent),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: size.width - 15,
            height: 330,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(product.img),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Card(
            color: Colors.white,
            child: Row(mainAxisAlignment: MainAxisAlignment.start,children: [Text(product.name, style: TextStyle(fontSize: 20)),Text(product.desk)],)
          ),
          Card(
            child: Column(
              children: [
                Icon(Icons.star, color: Colors.yellow, size: 20),
                Text(
                  product.ratings.toString(),
                  style: TextStyle(fontSize: 20),
                ),
                Text(product.price, style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          SizedBox(height: 400),
          ElevatedButton(
            style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(size.width - 20, 40),),backgroundColor: WidgetStatePropertyAll( Colors.green,)),
            onPressed: () {
              setState(() {
                product.chart = !product.chart;
              });
            },
            child: Center(
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart,color: Colors.white,),
                  SizedBox(width: 5),
                  Text("Add to card",style: TextStyle(color: Colors.white),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}