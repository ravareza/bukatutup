import 'package:flutter/material.dart';
import 'package:project_uas/pages/login_page.dart';
import 'package:project_uas/pages/menu_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
  final TextEditingController _nama = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

  bool _obscure = true;
  bool _rememberMe = true;
  IconData _isObsercureIcon = Icons.remove_red_eye;
  bool _sobcure = true;
  IconData _sobcureIcon = Icons.remove_red_eye;
  void isObsercureTex() {
    if (_obscure) {
      _obscure = false;
      _isObsercureIcon = Icons.remove_red_eye_outlined;
    } else {
      _obscure = true;
      _isObsercureIcon = Icons.remove_red_eye;
    }
  }
  void isObsercureText() {
    if (_sobcure) {
      _sobcure = false;
      _sobcureIcon = Icons.remove_red_eye_outlined;
    } else {
      _sobcure = true;
      _sobcureIcon = Icons.remove_red_eye;
    }
  }

  void isObscure() {
    setState(() {
      _obscure = !_obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.white,
              Colors.white,
              Colors.lightBlueAccent,
            ],radius: 0.8,
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              color: Colors.black45,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "ASTRONOMIK",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Nama",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      controller: _nama,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Rava reza",
                        alignLabelWithHint: true,
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      controller: _username,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: "Reza",
                        alignLabelWithHint: true,
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      controller: _password,
                      keyboardType: TextInputType.text,
                      obscureText: _obscure,
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
                        hintText: "12345678",
                        alignLabelWithHint: true,
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Confirm Password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      controller: _confirmpassword,
                      keyboardType: TextInputType.text,
                      obscureText: _sobcure,
                      decoration: InputDecoration(
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObsercureText();
                            });
                          },
                          icon: Icon(_sobcureIcon, color: Colors.black),
                        ),
                        hintText: "12345678",
                        alignLabelWithHint: true,
                        focusColor: Colors.white,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(200, 1),),backgroundColor: WidgetStatePropertyAll( Colors.blueAccent,)),
                          onPressed: () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            });
                          },
                          child: Text(
                            "Batal",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(200, 1),),backgroundColor: WidgetStatePropertyAll( Colors.redAccent,)),
                          onPressed: () {
                            setState(() {
                              if (_confirmpassword.text == _password.text &&
                                  _username.text.isNotEmpty &&
                                  _password.text.isNotEmpty &&
                                  _nama.text.isNotEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      AlertDialog(title: Text("Daftar Sukses")),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      AlertDialog(title: Text("Daftar Gagal")),
                                );
                              }
                            });
                          },
                          child: Text(
                            "Daftar",
                            style: TextStyle(color: Colors.white),
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
      ),
    );
  }
}

