import 'package:auth_ui/discord/login.dart';
import 'package:auth_ui/discord/register.dart';
import 'package:flutter/material.dart';
import 'config.dart';

// Welcome Page

class DiscordWelcome extends StatefulWidget {
  @override
  _DiscordWelcomeState createState() => _DiscordWelcomeState();
}

class _DiscordWelcomeState extends State<DiscordWelcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // change background color
        // or remove to use a Bg Image
        backgroundColor: Color(0xff23272a),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Image(
                          image: AssetImage("assets/discord/DiscordLogo.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Welcome To Discord",
                            style: TextStyle(
                                fontSize: 30.0, fontFamily: "TepenoBold"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text(
                              "Join over 200 million people who use Discord to chat with friends for free",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "TapenoRegular",
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 50.0,
                        child: MaterialButton(
                          onPressed: () {
                            // ====== Implement Register Functionality Here ===== //
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 16.0, fontFamily: "TepenoreRegular"),
                          ),
                          color: registerBtnColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          height: 50.0,
                          width: double.infinity,
                          child: MaterialButton(
                            onPressed: () {
                              // ====== Implement Login Functionality Here ===== //
                               Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontFamily: "TepenoreRegular"),
                            ),
                            color: loginBtnColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
