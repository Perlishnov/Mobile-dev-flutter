import 'package:flutter/material.dart';
import 'package:store_app/views/auth_screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: LoginScreen()
    );
  }
}
