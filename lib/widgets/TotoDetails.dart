import 'package:flutter/material.dart';

import 'package:todolist/models/Todo.dart';

class TodoDetails extends StatefulWidget {
  TodoDetails({Key key, this.todo, this.show}) : super(key: key);

  List<Todo> todo;
  bool show;

  @override
  _TodoDetails createState() => _TodoDetails();
}

class _TodoDetails extends State<TodoDetails> {
  @override
  Widget build(BuildContext context) {
    // Erreur lorsque show est true problème avec un setState
    return widget.show
        ? showDialog(
            context: context,
            builder: (_) => new AlertDialog(
                  title: new Text("Material Dialog"),
                  content: new Text("Hey! I'm Coflutter!"),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Close me!'),
                      onPressed: () {
                        Navigator.pop(context);
                        print('close');
                      },
                    )
                  ],
                ))
        : Container();
    // });
  }
}
