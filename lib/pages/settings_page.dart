import 'package:flutter/material.dart';
import 'package:project_uas/pages/aboutapp.dart';
import 'package:project_uas/pages/login_page.dart';
import 'package:project_uas/pages/register_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          SizedBox(
            width: 500,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginPage();
                    },
                  ),
                );
              },
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Change account',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),

          SizedBox(height: 12),

          SizedBox(
            width: 500,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegisterPage();
                    },
                  ),
                );
              },
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'create new account',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),

          SizedBox(height: 50),

          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Aboutapp();
                  },
                ),
              );
            },
            child: SizedBox(
              width: double.infinity,
              child: Text(
                'About this app',
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
