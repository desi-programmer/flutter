import 'dart:convert';

import 'package:dio/dio.dart';

class NotesController {
  String BASE_URL = "http://10.0.2.2/notes_api";
  Dio dio = Dio();

  Future<List> getNotes() async {
    try {
      var response = await dio.get(BASE_URL);
      return response.data['data'];
    } on DioError catch (e) {
      print(e);
      return Future.error("Error Fetching your Notes");
    }
  }

  createNote(String note) async {
    try {
      await dio.post(
        "http://10.0.2.2/notes_api/",
        data: jsonEncode(
          {
            "note": note,
          },
        ),
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
    } on DioError catch (e) {
      print(e);
      return Future.error("Error Inserting your Notes");
    }
  }

  deleteNote(String id) async {
    try {
      await dio.delete(
        "http://10.0.2.2/notes_api/",
        data: jsonEncode(
          {
            "id": id,
          },
        ),
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
    } on DioError catch (e) {
      print(e);
      return Future.error("Error Deleting your Notes");
    }
  }

  updateNote(String id, String note) async {
    try {
      await dio.put(
        "http://10.0.2.2/notes_api/",
        data: jsonEncode(
          {
            "id": id,
            "note": note,
          },
        ),
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
      );
    } on DioError catch (e) {
      print(e);
      return Future.error("Error Updating your Notes");
    }
  }
}
