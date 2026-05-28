import 'package:flutter/material.dart';
import 'package:project_uas/models/catprofile.dart';
import 'package:project_uas/pages/address_page.dart';
import 'package:project_uas/pages/cart_page.dart';
import 'package:project_uas/pages/order_page.dart';
import 'package:project_uas/pages/settings_page.dart';

List<Catprofile> cp = [
  Catprofile(
    icon: Icons.receipt_long,
    label: "Order",
    color: Colors.cyan,
    page: OrderPage(),
  ),
  Catprofile(
    icon: Icons.pin_drop,
    label: "Address",
    color: Colors.cyan,
    page: AddressPage(),
  ),
  Catprofile(
    icon: Icons.shopping_cart,
    label: "Chart",
    color: Colors.cyan,
    page: ChartPage(),
  ),
  Catprofile(
    icon: Icons.settings,
    label: "Settings",
    color: Colors.cyan,
    page: SettingsPage(),
  ),
];
