import 'package:auth_ui/discord/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          accentColor: Color(0xff7289DA),
          accentColorBrightness: Brightness.dark),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff2c2f33),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Auth UIs",
                      style: TextStyle(
                          fontSize: 30.0, fontFamily: "TepenoRegular"),
                    ),
                    Text("Login, Signup And Reset Password Screen UI")
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DiscordWelcome(),
                    ),
                  );
                },
                child: Text(
                  "Discord",
                  style: TextStyle(fontFamily: "TepenoRegular"),
                ),
                color: Color(0xff7289DA),
                colorBrightness: Brightness.dark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
