import 'package:flutter/material.dart';
import './home.dart' as home;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      theme: ThemeData(
       primaryColor: Colors.yellow
      ),
      home: home.MyHomePage(title: 'To Do App'),
    );
  }
}

