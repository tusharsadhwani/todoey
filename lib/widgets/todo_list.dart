import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/todo.dart';

class TodoListview extends StatefulWidget {
  const TodoListview({
    Key key,
  }) : super(key: key);

  @override
  _TodoListviewState createState() => _TodoListviewState();
}

class _TodoListviewState extends State<TodoListview> {
  TodoList _todolist;
  @override
  Widget build(BuildContext context) {
    _todolist = Provider.of<TodoList>(context);

    return Expanded(
      flex: 6,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 35,
                color: Colors.grey.shade500,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            primary: false,
            itemBuilder: (_, i) {
              final todos = _todolist.todos;
              return CheckboxListTile(
                title: Text(todos[i].content),
                value: todos[i].done,
                onChanged: (newValue) {
                  setState(() {
                    todos[i].done = newValue;
                  });
                },
              );
            },
            itemCount: _todolist.todos.length,
          ),
        ),
      ),
    );
  }
}
