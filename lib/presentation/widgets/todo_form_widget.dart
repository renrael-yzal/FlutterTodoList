import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final ValueChanged<String> onChangedTitle;
  final VoidCallback onSavedTodo;
  TodoFormWidget({
    Key? key,
    this.title = "",
    required this.onChangedTitle,
    required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      buildTitle(),
      SizedBox(height: 8),
      // buildDescription(),
      // SizedBox(height: 32),
      buildButton(),
    ]);
  }

  Widget buildTitle() => TextFormField(
        initialValue: title,
        validator: (title) {
          if (title!.isEmpty) {
            return null;
          } else {
            return 'Title cannot be empty';
          }
        },
        onChanged: onChangedTitle,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: "Task",
        ),
      );

  Widget buildButton() => SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: onSavedTodo, child: Text("save")));
}
