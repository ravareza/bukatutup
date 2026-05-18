import 'package:flutter/cupertino.dart';

class ProductModel {
  final String name;
  final String price;
  final double ratings;
  bool favorite = false;
  final String img;
  final String desk;
  final int id;

  ProductModel({
    required this.name,
    required this.price,
    required this.ratings,
    required this.favorite,
    required this.img, required this.desk, required this.id,
  });
}
