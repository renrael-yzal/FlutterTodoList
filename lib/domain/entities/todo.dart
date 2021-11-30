class Todo {
  int id = -1;
  String title;
  bool status = false;
  Todo(this.id, this.title, this.status);

  Map toJson() => {"id": id, "title": title, "status": status};
}
