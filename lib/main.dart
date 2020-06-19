import 'package:architecturetraining/widgets/todo_list_bloc_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(appTitle: 'Sample architecture app'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.appTitle}) : super(key: key);

  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Container(
        color: Colors.black12,
        alignment: Alignment.center,
        child: TodoListBlocWidget(),
      ),
    );
  }
}
