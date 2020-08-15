import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class Todo {
  final String content;
  bool done;

  Todo({
    @required this.content,
    @required this.done,
  });
}

class TodoList extends ChangeNotifier {
  final _todos = <Todo>[];

  List<Todo> get todos => _todos;

  void addTodo(String content) {
    todos.add(Todo(content: content, done: false));
    notifyListeners();
  }
}
