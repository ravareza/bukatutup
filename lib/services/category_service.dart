import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_uas/models/category_model.dart';
import 'package:project_uas/pages/electronic_page.dart';
import 'package:project_uas/pages/fash_food.dart';
import 'package:project_uas/pages/fashion_page.dart';
import 'package:project_uas/pages/sport_page.dart';
List<CategoryModel> cat = [
  CategoryModel(id: 0, icon: Icons.electric_bolt, labelcat: "Electronic",color: Colors.redAccent, page:  ElectronicPage()),
  CategoryModel(id: 1, icon: Icons.sports_baseball, labelcat: "Sport",color: Colors.orange, page:  SportPage()),
  CategoryModel(id: 2, icon: Icons.fastfood, labelcat: "Food",color: Colors.yellow, page:  FashFood()),
  CategoryModel(id: 3, icon: Icons.shopping_bag, labelcat: "Fashion",color: Colors.lime, page:  FashionPage()),
];