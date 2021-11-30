import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_application/data/repositories/data_todo_repository.dart';
import 'package:todo_list_application/domain/entities/todo.dart';
import 'package:todo_list_application/presentation/widgets/edit_widget.dart';

class TodoWidget extends StatelessWidget {
  Todo todo;
  TodoWidget({required this.todo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Checkbox(
            value: todo.status,
            activeColor: Colors.green,
            onChanged: (bool? value) {
              todo.status = value!;
              final provider =
                  Provider.of<DataTodoRepository>(context, listen: false);
              provider.updateTodo(todo);
            },
          ),
          Expanded(
              child: todo.status
                  ? Text(todo.title,
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.red))
                  : Text(todo.title)),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) =>
                    EditTodoDialogWidget(todo: todo),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              final provider =
                  Provider.of<DataTodoRepository>(context, listen: false);
              provider.removeTodo(todo);
            },
          )
        ]));
  }
}
