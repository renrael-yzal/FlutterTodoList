import 'dart:convert';
import 'package:http/http.dart';
import 'package:todo_list_application/domain/entities/todo.dart';
import 'package:todo_list_application/domain/repositories/todo_repository.dart';
import 'package:todo_list_application/data/network_data/data_from_api.dart';

class DataTodoRepository extends TodoRepository {
  DataTodoRepository() {
    getTodoList();
  }
  @override
  addTodo(Todo todo) {
    // print("todo added");

    DataSeeker.postData(todo);
    todos_.add(todo);
    notifyListeners();
  }

  @override
  removeTodo(Todo todo) {
    DataSeeker.deleteData(todo);
    todos_.remove(todo);
    // print("todo removed");
    notifyListeners();
  }

  @override
  updateTodo(Todo todo) {
    print("todo updated");
    print(todo.status);
    DataSeeker.putData(todo);
    notifyListeners();
  }

  @override
  Future<void> getTodoList() async {
    // DataSeeker ds = new DataSeeker();
    // final String url = "https://jsonplaceholder.typicode.com/posts";
    // final String url = "http://localhost:8080/todos";
    final String url = "http://192.168.1.101:8080/todos";
    List<Todo> todos = [];
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);
      for (var element in jsonData as List) {
        todos.add(Todo(element["id"], element["title"], false));
      }
    } catch (err) {
      todos = [];
      // print(">>>>>>>>>>>>>>>>>$err>>>>>>>>>>>");
    }
    super.todos_ = todos;
    notifyListeners();
  }
}
