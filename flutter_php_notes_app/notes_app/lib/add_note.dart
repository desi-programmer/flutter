import 'package:flutter/material.dart';
import 'package:notes_app/controller/notes_controller.dart';

class NoteEditor extends StatefulWidget {
  final bool? edit;
  final String? id;
  final String? note;

  const NoteEditor({Key? key, this.edit, this.note, this.id}) : super(key: key);

  @override
  _NoteEditorState createState() => _NoteEditorState();
}

class _NoteEditorState extends State<NoteEditor> {
  String? note;
  bool edited = false;
  String oldNote = "";
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose(); //prevents memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.edit != null && widget.edit!) {
      _controller.text = widget.note!;
      note = widget.note;
      oldNote = widget.note!;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Note",
        ),
      ),
      //
      body: Column(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                filled: true,
                fillColor: Color(0xffeeeeee),
                hintText: "Add A Note",
              ),
              controller: _controller,
              maxLines: null,
              minLines: 150,
              keyboardType: TextInputType.multiline,
              maxLength: 1000,
              onChanged: (_val) {
                note = _val;
              },
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 50.0,
              width: double.maxFinite,
              child: ElevatedButton(
                child: Text(
                  "Add Note",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  NotesController controller = NotesController();
                  if (note != null && note!.isNotEmpty) {
                    if (widget.edit != null && widget.edit!) {
                      if (note!.compareTo(oldNote) != 0) {
                        //  change
                        controller.updateNote(widget.id!, note!);
                        Navigator.of(context).pop();
                      }
                    } else {
                      controller.createNote(note!);
                      Navigator.of(context).pop();
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
