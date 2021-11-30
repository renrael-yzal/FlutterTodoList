import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_application/data/repositories/data_todo_repository.dart';
import 'package:todo_list_application/domain/entities/todo.dart';
import 'package:todo_list_application/presentation/widgets/add_todo_widget.dart';
import 'package:todo_list_application/presentation/widgets/appbar_widget.dart';
import 'package:todo_list_application/presentation/widgets/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataTodoRepository>(context);
    final List<Todo> todos = provider.todos_;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(title_: "Todo List"),
        ),
        body: todos.isEmpty
            ? Center(
                child: Text(
                "No Todos / check your internet Connection",
                style: TextStyle(fontSize: 23),
              ))
            : TodoListWidget(
                todos: todos,
              ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) => AddTodoDialogWidget(),
              );
            }));
  }
}
