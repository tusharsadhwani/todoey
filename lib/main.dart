import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'model/todo.dart';
import 'widgets/header.dart';
import 'widgets/todo_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return ChangeNotifierProvider(
      create: (_) => TodoList(),
      child: MaterialApp(
        title: 'Todoey',
        theme: ThemeData(
          primaryColor: Colors.lightBlueAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline2: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            headline6: TextStyle(
              color: Colors.white,
            ),
            subtitle1: TextStyle(fontSize: 18),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.lightBlueAccent,
          ),
        ),
        home: MyHomePage(title: 'Todoey'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TodoList _todoList;

  @override
  Widget build(BuildContext context) {
    _todoList = Provider.of<TodoList>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Header(),
          TodoListview(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newTodo,
        child: Icon(Icons.add),
      ),
    );
  }

  void _newTodo() {
    _todoList.addTodo('whatever');
  }
}
