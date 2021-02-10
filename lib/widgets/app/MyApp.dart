import 'package:flutter/material.dart';
import 'package:todolist/widgets/pages/AllTodoPage.dart';
import 'package:todolist/data/todos.dart' as data;
import 'package:todolist/data/selectedTodo.dart' as dialog;

class MyApp extends StatelessWidget {
  final String _title = 'My todo list';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AllTodosPage(title: _title, todos: data.todos),
    );
  }
}
