import 'dart:convert';
import 'package:consumer/future_infinite_scroll.dart';
import 'package:consumer/infinite_scroll_package.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Consumer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(),
      home: InfiniteScrollPackage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 1;
  Future<Map> getPosts() async {
    try {
      var response = await http.get(
        Uri.parse(
          "http://10.0.2.2:8000/apis?page=${currentPage}",
        ),
      );
      if (response.statusCode == 200) {
        // return a decoded body
        // print(response.body);
        return jsonDecode(response.body);
      } else {
        // server error
        return Future.error("Server Error !");
      }
    } catch (SocketException) {
      // fetching error
      // may be timeout, no internet or dns not resolved
      return Future.error("Error Fetching Data !");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Pagination",
          ),
        ),
        //
        body: SingleChildScrollView(
          child: FutureBuilder<Map>(
            future: getPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!['ideas'].length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(
                            15.0,
                          ),
                          padding: EdgeInsets.all(
                            15.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "${snapshot.data!['ideas'][index]['title']}",
                                style: TextStyle(
                                  fontSize: 24.0,
                                ),
                              ),
                              //
                              Text(
                                "${snapshot.data!['ideas'][index]['description']}",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              //
                              Text(
                                DateTime.parse(snapshot.data!['ideas'][index]
                                        ['created'])
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    //
                    //
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (snapshot.data!['currenPage'] <
                            snapshot.data!['totalPages'])
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                currentPage++;
                              });
                            },
                            child: Text(
                              "Next",
                            ),
                          ),
                        if (snapshot.data!['currenPage'] > 1)
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                currentPage--;
                              });
                            },
                            child: Text(
                              "Previous",
                            ),
                          ),
                      ],
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}
