import 'package:flutter/widgets.dart';
import 'package:todo_list_application/domain/entities/todo.dart';

abstract class TodoRepository extends ChangeNotifier {
  List<Todo> todos_ = [];
  addTodo(Todo todo);
  removeTodo(Todo todo);
  updateTodo(Todo todo);
  getTodoList();
}
