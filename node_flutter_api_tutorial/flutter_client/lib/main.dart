import 'package:flutter/material.dart';
import 'package:flutter_client/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Node JS',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: "martel",
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
