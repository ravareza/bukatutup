import 'package:flutter/material.dart';
import 'package:project_uas/models/menu_model.dart';
import 'package:project_uas/pages/profile_page.dart';
import 'cart_page.dart';
import 'favorite_page.dart';
import 'home_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int selected = 0;

  late final Map<int, MenuModel> apa;

  @override
  void initState() {
    super.initState();
    apa = {
      0: MenuModel(
        page: const HomePage(),
        icon: Icons.home,
        label: "Home",
        color: Colors.deepPurpleAccent,
      ),
      1: MenuModel(
        label: "Favorite",
        icon: Icons.favorite,
        color: Colors.deepPurpleAccent,
        page: const FavoritePage(),
      ),
      2: MenuModel(
        label: "Cart",
        icon: Icons.shopping_cart,
        color: Colors.deepPurpleAccent,
        page: const ChartPage(),
      ),
      3: MenuModel(
        label: "Profile",
        page: const ProfilePage(),
        icon: Icons.person,
        color: Colors.deepPurpleAccent,
      ),
    }; // ✅ FIX: Missing closing `};` for the map — caused entire class to break
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.black],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        currentIndex: selected,
        onTap: (value) {
          setState(() {
            selected = value;
          });
        },
        items: apa.entries
            .map(
              (s) => BottomNavigationBarItem(
            icon: Icon(s.value.icon),
            activeIcon: Icon(s.value.icon),
            label: s.value.label,
            backgroundColor: s.value.color,
          ),
        )
            .toList(),
      ),
      body: apa[selected]?.page,
    );
  }
}