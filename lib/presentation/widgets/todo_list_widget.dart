import 'package:flutter/material.dart';
import 'package:todo_list_application/domain/entities/todo.dart';
import 'package:todo_list_application/presentation/widgets/todowidget.dart';

class TodoListWidget extends StatelessWidget {
  List<Todo> todos = [];
  TodoListWidget({required this.todos, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(8),
        itemCount: todos.length,
        separatorBuilder: (context, index) => Container(height: 3),
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: TodoWidget(
              todo: todo,
            ),
          );
        });
  }
}
