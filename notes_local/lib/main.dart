import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:notes_local/add_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('notes');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.red,
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
  Box box;
  Map data;

  @override
  void initState() {
    super.initState();
    box = Hive.box('notes');
  }

  Future<Map> fetch() {
    if (box.values.isEmpty) {
      return Future.value(null);
    } else {
      return Future.value(box.toMap());
    }
  }

  @override
  Widget build(BuildContext context) {
    // add();
    // fetch();
    return Scaffold(
      backgroundColor: Colors.red[400],
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
        backgroundColor: Colors.red[400],
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
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: FutureBuilder<Map>(
        future: fetch(),
        builder: (context, snapshot) {
          // print(snapshot.data);
          if (snapshot.data == null) {
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
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                // Map data = snapshot.data[index];
                Map data = box.getAt(index);
                print(data);
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
                                    .format(data['date']),
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  box
                                      .deleteAt(index)
                                      .then((value) => setState(() {}));
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
