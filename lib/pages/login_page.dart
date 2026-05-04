import 'package:flutter/material.dart';
import 'package:project_uas/pages/menu_page.dart';
import 'package:project_uas/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _pasword = TextEditingController();
  bool _isObsercure = true;
  IconData _isObsercureIcon = Icons.remove_red_eye;
  bool _remember = true;

  void isObsercureTex() {
    if (_isObsercure) {
      _isObsercure = false;
      _isObsercureIcon = Icons.remove_red_eye_outlined;
    } else {
      _isObsercure = true;
      _isObsercureIcon = Icons.remove_red_eye;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("aset/awa/merah.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Card(
              color: Colors.black45,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hallo hallo",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                              offset: Offset(1, 1),
                              color: Colors.purpleAccent,
                              blurRadius: 3,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.thumb_up, size: 50, color: Colors.white),
                    ],
                  ),
                  Text(
                    "Login Dulu",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                          offset: Offset(1, 1),
                          color: Colors.purpleAccent,
                          blurRadius: 3,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: _username,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Username",
                      alignLabelWithHint: true,
                      focusColor: Colors.white,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _pasword,
                    keyboardType: TextInputType.text,
                    obscureText: _isObsercure,
                    decoration: InputDecoration(
                      filled: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObsercureTex();
                          });
                        },
                        icon: Icon(_isObsercureIcon, color: Colors.black),
                      ),
                      hintText: "Password",
                      alignLabelWithHint: true,
                      focusColor: Colors.white,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _remember,
                        onChanged: (value) {
                          setState(() {
                            _remember = !_remember;
                          });
                        },
                      ),
                      Text("Ingat Saya", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_username.value.text == 'Rava Reza' &&
                            _pasword.value.text == '1111') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MenuPage()),
                          );
                          showDialog(
                            context: context,
                            builder: (context) =>
                                AlertDialog(title: Text("Login Berhasil"),),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Username atau Password salah"),
                            ),
                          );
                        }
                      });
                    },
                    child: Text("Login"),
                  ),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        "Belum Punya Akun???",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          });
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

