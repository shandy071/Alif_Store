import 'package:app_shoe_shop/pages/home_page.dart';
import 'package:app_shoe_shop/pages/main_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = 'admin';
  String password = 'admin';
  String alert = 'siap login';

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController emailInput = new TextEditingController();
  TextEditingController passwordInput = new TextEditingController();

  void login() {
    if (_formkey.currentState.validate()) {
      if (emailInput.text == email && passwordInput.text == password) {
        Navigator.of(context).pushNamed(Main.tag);
      } else {
        setState(() {
          alert = "Email atau Password salah";
        });
      }
      // print('Tes');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              // color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue,
                                  // blurRadius: 20.0,
                                  // offset: Offset(0, 10) )
                                )
                              ]),
                          child: Form(
                            key: _formkey,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.white))),
                                  child: TextFormField(
                                    controller: emailInput,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "isi username/email anda";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email or Username",
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: passwordInput,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "isi password anda";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue),
                          child: MaterialButton(
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            onPressed: () {
                              login();
                            },
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
