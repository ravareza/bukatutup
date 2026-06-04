import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  final String name;
  final String price;
  final String ratings;
  final String img;
  final bool isfavorite;
  final VoidCallback onTap;
  final VoidCallback onfavorite;
  final double width, height;
  final String addr;
  const ProductWidget({
    super.key,
    required this.name,
    required this.price,
    required this.ratings,
    required this.img,
    required this.onfavorite,
    required this.width,
    required this.height, required this.isfavorite, required this.onTap, required this.addr,
  });
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
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
                color: widget.isfavorite ? Colors.redAccent : Colors.grey,
              ),
            ),),
              Image.asset(
                widget.img,
                height: 120,
                width: 150,
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
                          Text(widget.ratings, style: TextStyle(fontSize: 12)),SizedBox(width: 130,),Text(widget.addr, style: TextStyle(fontSize: 12),
                          )],
                      ),
                    ],
                  ),
                ],
              ),
          ),
      ),
    );
  }
}
