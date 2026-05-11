import 'package:flutter/material.dart';
import 'package:project_uas/pages/forget_password.dart';
import 'package:project_uas/pages/menu_page.dart';
import 'package:project_uas/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>  {
  final _username = TextEditingController();
  final _password = TextEditingController();

  bool _obscure = true;
  bool _rememberMe = true;
  IconData _isObsercureIcon = Icons.remove_red_eye;

  void isObsercureTex() {
    if (_obscure) {
      _obscure = false;
      _isObsercureIcon = Icons.remove_red_eye_outlined;
    } else {
      _obscure = true;
      _isObsercureIcon = Icons.remove_red_eye;
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
                      "Login",
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
                      controller: _username,
                      keyboardType: TextInputType.text,
                      obscureText: false,
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
                        hintText: "Password",
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
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = !_rememberMe;
                            });
                          },
                        ),
                        Text(
                          "Ingat saya",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword(),)), child: Text("Forget Password"))
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ElevatedButton(
                        style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(200, 1),),backgroundColor: WidgetStatePropertyAll( Colors.redAccent,)),
                        onPressed: () {
                          setState(() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),));
                          });
                        },
                        child: Text(
                          "Daftar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                        ElevatedButton(
                          style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(200, 1),),backgroundColor: WidgetStatePropertyAll( Colors.blueAccent,)),
                          onPressed: () {
                            setState(() {
                              if (_username.text == "Rava" && _password.text == "Reza") {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      AlertDialog(title: Text("Login Sukses")),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      AlertDialog(title: Text("Login Gagal")),
                                );
                              }
                            });
                          },
                          child: Text(
                            "Login",
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

