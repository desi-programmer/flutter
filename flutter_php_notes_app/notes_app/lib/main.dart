import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:notes_app/add_note.dart';
import 'package:notes_app/controller/notes_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: "customfont",
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NotesController notesController = NotesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
        ),
        centerTitle: true,
      ),
      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => NoteEditor(),
            ),
          )
              .whenComplete(() {
            setState(() {});
          });
        },
        child: Icon(LineIcons.plus),
      ),
      //
      body: FutureBuilder<List>(
        future: notesController.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Map data = snapshot.data![index];
                DateTime date = DateTime.parse(data['datetime']);
                return Card(
                  margin: EdgeInsets.all(
                    8.0,
                  ),
                  elevation: 5.0,
                  shadowColor: Colors.grey,
                  child: ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          scrollable: true,
                          content: Text(
                            data['note'],
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      );
                    },

                    onLongPress: () {
                      // update
                      Navigator.of(context)
                          .push(
                        MaterialPageRoute(
                          builder: (context) => NoteEditor(
                            edit: true,
                            id: data['id'],
                            note: data['note'],
                          ),
                        ),
                      )
                          .whenComplete(() {
                        setState(() {});
                      });
                    },

                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 15.0,
                    ),
                    title: Text(
                      "${data['note']}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    //
                    subtitle: Text(
                      DateFormat("\ndd-MM-yyyy kk:mm a")
                          .format(date)
                          .toString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    //
                    trailing: IconButton(
                      onPressed: () async {
                        await notesController.deleteNote(data['id']);
                        setState(() {});
                      },
                      icon: Icon(
                        LineIcons.trash,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "${snapshot.error}",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            );
          } else {
            return Center(
              child: Text(
                "Fetching your notes..",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
