import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/main_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todoアプリ',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel()..getTodoList(),
        child: Scaffold(
          appBar: AppBar(
            title: StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return Text('Todoアプリ');
              }
            ),
          ),
          body: Consumer<MainModel>(builder: (context, model, child) {
            final todoList = model.todoList;
            return ListView(
              children: todoList.map(
                  (todo) => ListTile(
                    title: Text(todo.title),
                ),
              ).toList(),
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todoアプリ'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

