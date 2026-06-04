import 'package:flutter/material.dart';
import 'package:project_uas/models/product_model.dart';
import 'package:project_uas/pages/checkout.dart';
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Row(mainAxisAlignment: MainAxisAlignment.start,children: [ Text(product.name, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),],),

                Text(product.desk,style: TextStyle(fontFamily: 'italic',fontSize: 17),),
              ],
            ),
          ),
          Card(
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 20),
                Text(
                  product.ratings.toString(),
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 280),
                Text(product.price, style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
          SizedBox(height: 400),
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(Size(size.width - 20, 70)),
              backgroundColor: WidgetStatePropertyAll(Colors.green),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Checkout(product: product,),));
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_bag, color: Colors.white),
                  SizedBox(width: 5),
                  Text("Buy Now", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
