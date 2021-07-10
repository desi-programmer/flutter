import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite_notepad/add_page.dart';
import 'package:sqflite_notepad/sqflite_helper.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primaryColor: Color(0xff10ac84),
        accentColor: Color(0xff10ac84),
        buttonColor: Color(0xff10ac84),
        fontFamily: "customfont",
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
  }

  Future<List> fetch() async {
    return [
      {"name": "Prince"}
    ];
  }

  @override
  Widget build(BuildContext context) {
    // add();
    // fetch();
    return Scaffold(
      backgroundColor: Color(0xff10ac84),
      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xff10ac84),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // add();
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => AddNote(),
                ),
              )
              .then((value) => setState(() {}));
        },
        child: Icon(
          Icons.add,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: Color(0xff3ae374),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: FutureBuilder<List>(
        future: databaseHelper.getData(),
        builder: (context, snapshot) {
          // print(snapshot.data);
          if (snapshot.data == null || snapshot.data?.length == 0) {
            return Center(
              child: Text(
                "No Notes 😥",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Map data = snapshot.data?[index];
                return InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("${data['title']}"),
                        content: Text("${data['data']}"),
                        scrollable: true,
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 15.0,
                    ),
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['title'],
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                          Text(
                            data['data'],
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat('hh:mm a yyy-mm-dd ')
                                    .format(DateTime.parse(data['date'])),
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // delete
                                  print(data['id'].runtimeType);
                                  databaseHelper.deleteData(data['id']);
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.delete_outline_sharp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
