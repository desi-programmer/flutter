import 'package:flutter/material.dart';
import 'config.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = false;
  FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // probably Colors.transparent wasn't working
          backgroundColor: Color(0xff23272a),
          elevation: 0.0,
        ),
        backgroundColor: Color(0xff23272a),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Welcome back !",
                    style: TextStyle(fontSize: 24.0, fontFamily: "TepenoBold"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Log in with your to shart chatting",
                      style: TextStyle(fontFamily: "TepenoRegular"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.black54),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: TextFormField(
                                    autofocus: true,
                                    onEditingComplete: () {
                                      debugPrint("Completed");
                                      FocusScope.of(context)
                                          .requestFocus(myFocusNode);
                                    },
                                    decoration: InputDecoration(
                                      // fillColor: Colors.black54,
                                      // filled: true,
                                      disabledBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      labelStyle: TextStyle(
                                        fontFamily: "TepenoRegular",
                                        color: Colors.white,
                                        fontSize: 14.0,
                                      ),
                                      labelText: "Email",
                                    ),
                                    style: TextStyle(
                                      fontFamily: "TepenoRegular",
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 12.0,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.black54),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: TextFormField(
                                      focusNode: myFocusNode,
                                      obscureText: !isVisible,
                                      decoration: InputDecoration(
                                        // fillColor: Colors.black54,
                                        // filled: true,
                                        suffixIcon: IconButton(
                                          icon: isVisible
                                              ? Icon(Icons.visibility)
                                              : Icon(Icons.visibility_off),
                                          color: Colors.white,
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          onPressed: () {
                                            setState(() {
                                              isVisible = !isVisible;
                                            });
                                          },
                                        ),
                                        disabledBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        labelStyle: TextStyle(
                                          fontFamily: "TepenoRegular",
                                          color: Colors.white,
                                          fontSize: 14.0,
                                        ),
                                        labelText: "Password",
                                      ),
                                      style: TextStyle(
                                        fontFamily: "TepenoRegular",
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                            onTap: () {
                              // ===== move to forgot passwprd here =====
                              debugPrint("Forgot Password Tapped !");
                            },
                            child: Text(
                              "Forgot Your Password ?",
                              style: TextStyle(
                                fontFamily: "TepenoRegular",
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 6.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              onTap: () {
                                // ===== move to forgot passwprd here =====
                                debugPrint("Password manager tapped !");
                              },
                              child: Text(
                                "Use a password manager ?",
                                style: TextStyle(
                                  fontFamily: "TepenoRegular",
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15.0),
                          color: registerBtnColor,
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontFamily: "TepenoRegular",
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
