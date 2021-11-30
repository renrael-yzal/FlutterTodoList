import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:todo_list_application/domain/entities/todo.dart';

class DataSeeker {
  // static String url = "http://localhost:8080/todos";
  static String url = "http://192.168.1.101:8080/todos";

  static void postData(Todo todo) async {
    try {
      final response = await post(Uri.parse(url),
          body: jsonEncode({"title": todo.title, "status": false}),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });
    } catch (err) {
      print(err);
    }
  }

  static void putData(Todo todo) async {
    try {
      final response = await put(Uri.parse("${url}/${todo.id}"),
          body: jsonEncode({"title": todo.title, "status": "${todo.status}"}),
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          });
    } catch (err) {
      print(err);
    }
  }

  static void deleteData(Todo todo) async {
    try {
      final response = await delete(Uri.parse("${url}/${todo.id}"));
    } catch (err) {
      print(err);
    }
  }
}
