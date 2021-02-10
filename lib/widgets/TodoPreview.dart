import 'package:flutter/material.dart';
import 'package:todolist/models/Todo.dart';
import 'package:todolist/widgets/TotoDetails.dart';

class TodoPreview extends StatefulWidget {
  TodoPreview(
      {Key key, this.todos, this.todo, this.index, this.callback, this.dialog})
      : super(key: key);

  final List<Todo> todos;
  final List<Todo> dialog;
  final Todo todo;
  final int index;

  Function(List<Todo>) callback;

  @override
  _TodoPreview createState() => _TodoPreview();
}

class _TodoPreview extends State<TodoPreview> {
  @override
  Widget build(BuildContext context) {
    print('Build Todo Preview');
    return new Card(
      color: widget.todo.done ? Colors.green : Colors.white,
      child: new InkWell(
        onTap: () {
          setState(() {
            new TodoDetails(todo: [widget.todo], show: true);
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Checkbox(
                value: widget.todo.done,
                onChanged: (bool newvalue) {
                  setState(() {
                    widget.todo.done = newvalue;
                  });
                }),
            Text('${widget.todo.title}'),
            FloatingActionButton(
                mini: true,
                isExtended: true,
                onPressed: () => {
                      widget.todos.removeAt(widget.index),
                      widget.callback(widget.todos)
                    },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.delete),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
