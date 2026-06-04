import 'package:flutter/material.dart';
import 'package:project_uas/models/catprofile.dart';
import 'package:project_uas/pages/cart_page.dart';
import 'package:project_uas/pages/favorite_page.dart';
import 'package:project_uas/pages/settings_page.dart';

List<Catprofile> cp = [
  Catprofile(
    icon: Icons.favorite,
    label: "favorite",
    page: FavoritePage(),
  ),
  Catprofile(
    icon: Icons.settings,
    label: "Settings",
    page: SettingsPage(),
  ),
];