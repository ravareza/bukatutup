import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  final String name;
  final String price;
  final String ratings;
  final String img;
  final VoidCallback onfavorite;
  final double width, height;
  const ProductWidget({
    super.key,
    required this.name,
    required this.price,
    required this.ratings,
    required this.img,
    required this.onfavorite,
    required this.width,
    required this.height,
  });
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Align(alignment: Alignment.topRight,child: IconButton(
            onPressed: widget.onfavorite,
            icon: Icon(Icons.favorite ,
              color: favorite ? Colors.redAccent : Colors.grey,
            ),
          ),),
            Image.asset(
              widget.img,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 5),
            Column(
              children: [

                    Text(
                      widget.name,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(widget.price, style: TextStyle(fontSize: 14)),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellowAccent),
                        Text(widget.ratings, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
        ),
    );
  }
}
