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
      0: MenuModel(page: HomePage(), icon: Icons.home, label: "Home", color: Colors.blue,
      ),
      1: MenuModel(label: "Favorite", icon: Icons.favorite, color: Colors.blue, page: FavoritePage(),
      ),
      2: MenuModel(label: "Cart", icon: Icons.shopping_cart, color: Colors.blue, page: ChartPage(),
      ),
      3: MenuModel(label: "Profile", page: ProfilePage(), icon: Icons.person, color: Colors.blue,
      ),
    };
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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue, Colors.blueAccent]),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue, Colors.blueAccent],
                ),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start),
            ),

            ListTile(
              leading: Icon(Icons.arrow_back_ios_new),
              title: Text("Back"),
              onTap: () {Navigator.pop(context);
              },
            ),
          SizedBox(width: 15),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {Navigator.pop(context);
            setState(() => selected = 0);
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("favorite"),
            onTap: () {Navigator.pop(context);
            setState(() => selected = 1);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart"),
            onTap: () {Navigator.pop(context);
            setState(() => selected = 2);
            },
          ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {Navigator.pop(context);
                setState(() => selected = 3);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined),
              title: Text("Settings"),
              onTap: () {Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text("address"),
              onTap: () {Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.receipt_long_outlined),
              title: Text("Pesanan"),
              onTap: () {Navigator.pop(context);
              },
            ),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text("LogOut"),
            onTap: () {Navigator.pop(context);
            },
          ),
          ],
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
