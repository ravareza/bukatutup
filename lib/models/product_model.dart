import 'package:flutter/cupertino.dart';

class ProductModel {
  final String name;
  final String price;
  final double ratings;
  bool favorite = false;
  bool chart = false;
  final String img;
  final String desk;
  final int id;
  String pay;
  String deliv;
  DateTime? favoriteadd;
  final String addres;

  ProductModel({required this.deliv,
    required this.pay,
    required this.name,
    required this.price,
    required this.ratings,
    required this.favorite,
    required this.chart,
    required this.img, required this.desk, required this.id,this.favoriteadd, required this.addres,
  });
}