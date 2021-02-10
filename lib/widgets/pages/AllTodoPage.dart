import 'package:flutter/material.dart';
import 'package:todolist/widgets/TodoMaster.dart';
import 'package:todolist/widgets/TotoDetails.dart';
import 'package:todolist/models/Todo.dart';

class AllTodosPage extends StatefulWidget {
  AllTodosPage({Key key, this.title, this.todos}) : super(key: key);

  final String title;
  final List<Todo> todos;

  @override
  _AllTodosPageState createState() => _AllTodosPageState();
}

class _AllTodosPageState extends State<AllTodosPage> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Build All Todo Page');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _controller,
              onSubmitted: (String value) {
                setState(() {
                  widget.todos.insert(0,
                      new Todo(title: value, content: "content", done: false));
                });
                _controller.text = '';
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter a todo task',
              ),
            ),
          ),
          new TodoMaster(todos: widget.todos),
          new TodoDetails(todo: [], show: false)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
