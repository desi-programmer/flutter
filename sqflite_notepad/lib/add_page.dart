import 'package:flutter/material.dart';
import 'package:sqflite_notepad/sqflite_helper.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String title = "";
  String data = "";
  DateTime time = DateTime.now();
  DatabaseHelper databaseHelper = DatabaseHelper();

  void add() {
    databaseHelper.insertData(
      title,
      data,
      time.toString(),
    );
    //
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add A Note",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0xff10ac84),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Title",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (val) {
                    title = val;
                  },
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Content",
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(),
                  maxLines: 10,
                  onChanged: (val) {
                    data = val;
                  },
                ),
                SizedBox(
                  height: 12.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    add();
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(
                        horizontal: 50.0,
                        vertical: 8.0,
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xff10ac84),
                    ),
                  ),
                  child: Text(
                    "ADD",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
