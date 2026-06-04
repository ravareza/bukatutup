import 'package:flutter/material.dart';
import '../services/catprofile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
                CircleAvatar(radius: 50, child: Icon(Icons.person, size: 70)),
                SizedBox(height: 15),
                Text(
                  'Nama akun',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  '@namaakun',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'selamat datang!',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: 110,
            padding: EdgeInsets.all(10),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.9,
              ),
              itemCount: cp.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => cp[i].page),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(cp[i].icon), Text(cp[i].label)],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
