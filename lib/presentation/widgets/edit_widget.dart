import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_application/data/repositories/data_todo_repository.dart';
import 'package:todo_list_application/domain/entities/todo.dart';
import 'package:todo_list_application/presentation/widgets/todo_form_widget.dart';

class EditTodoDialogWidget extends StatefulWidget {
  final Todo todo;
  EditTodoDialogWidget({Key? key, required this.todo}) : super(key: key);

  @override
  _EditTodoDialogWidgetState createState() => _EditTodoDialogWidgetState();
}

class _EditTodoDialogWidgetState extends State<EditTodoDialogWidget> {
  String title = "";
  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
  }

  // ignore: non_constant_identifier_names
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
            Text("Edit",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TodoFormWidget(
                title: title,
                onChangedTitle: (title) => setState(() {
                      this.title = title;
                    }),
                onSavedTodo: editTodo)
          ]),
    ));
  }

  void editTodo() {
    final isnotValid = _formkey.currentState!.validate();
    if (isnotValid) {
      return;
    } else {
      // print(title);
      widget.todo.title = title;
      final provider = Provider.of<DataTodoRepository>(context, listen: false);
      provider.updateTodo(widget.todo);
      Navigator.of(context).pop();
    }
  }
}
