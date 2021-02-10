import 'package:flutter/material.dart';
import 'package:todolist/models/Todo.dart';
import 'package:todolist/data/selectedTodo.dart' as dialog;
import 'TodoPreview.dart';
import 'TotoDetails.dart';

class TodoMaster extends StatefulWidget {
  TodoMaster({Key key, this.todos}) : super(key: key);

  List<Todo> todos;

  @override
  _TodoMaster createState() => _TodoMaster();
}

class _TodoMaster extends State<TodoMaster> {
  callback(newList) {
    setState(() {
      widget.todos = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Build Todo Master');
    return Expanded(
      child: widget.todos.length <= 0
          ? Center(child: Text("Aucune tâche"))
          : ListView.builder(
              itemCount: widget.todos.length,
              itemBuilder: (BuildContext context, int index) {
                final todo = widget.todos[index];

                return new TodoPreview(
                    todos: widget.todos,
                    todo: todo,
                    index: index,
                    callback: callback,
                    dialog: dialog.selectedTodo);
              }),
    );
  }
}
