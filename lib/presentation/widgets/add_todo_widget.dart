import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_application/data/repositories/data_todo_repository.dart';
import 'package:todo_list_application/domain/entities/todo.dart';
import 'package:todo_list_application/presentation/widgets/todo_form_widget.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({Key? key}) : super(key: key);

  @override
  _AddTodoDialogWidgetState createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  String title = "";
  String description = "";
  // String description = "";
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Form(
      key: _formkey,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add Task",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TodoFormWidget(
              onChangedTitle: (title) => setState(() => this.title = title),
              onSavedTodo: addTodo,
            )
          ]),
    ));
  }

  void addTodo() {
    final isnotValid = _formkey.currentState!.validate();
    if (isnotValid) {
      return;
    } else {
      // print(title);
      final todo = Todo(-1, title, false);
      final provider = Provider.of<DataTodoRepository>(context, listen: false);
      provider.addTodo(todo);
      Navigator.of(context).pop();
    }
  }
}
