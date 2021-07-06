import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddNote extends StatefulWidget {
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String title;
  String data;
  DateTime time = DateTime.now();

  void add() {
    Box box = Hive.box('notes');
    var value = {'title': title, 'date': DateTime.now(), 'data': data};
    box.add(value);
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
            fontWeight: FontWeight.w800,
          ),
        ),
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
                    hintText: "Title",
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
                        vertical: 10.0,
                      ),
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
