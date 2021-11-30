import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_application/data/repositories/data_todo_repository.dart';
import 'package:todo_list_application/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataTodoRepository(),
      child: MaterialApp(
        title: 'Todo List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
