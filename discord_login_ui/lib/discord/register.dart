import 'package:flutter/material.dart';
import 'config.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isVisible = false;

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
                    "Register",
                    style: TextStyle(fontSize: 32.0, fontFamily: "TepenoBold"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "What Should Everyone Call You ?".toUpperCase(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: "TepenoBold",
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Form(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.black54),
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextFormField(
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
                                  labelText: "Username",
                                ),
                                style: TextStyle(
                                  fontFamily: "TepenoRegular",
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Account Information".toUpperCase(),
                            style: TextStyle(
                              fontFamily: "TepenoBold",
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
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
                                    vertical: 10.0,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.black54),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: TextFormField(
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
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.0,
                            ),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontFamily: "TepenoRegular",
                                ),
                                children: [
                                  TextSpan(
                                      text:
                                          " By registering, you agree to our "),
                                  TextSpan(
                                    text: "Terms Of Service",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          color: registerBtnColor,
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: MaterialButton(
                            onPressed: () {},
                            child: Text(
                              "Create an account",
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
