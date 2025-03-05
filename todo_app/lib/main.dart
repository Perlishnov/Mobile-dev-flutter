import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './home.dart' as home;
import 'color_theme.dart';
void main() async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelection = ColorSelection.deepPurple;

  void changeThemeMode(bool useLightMode){
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }
  void changeColor(int value){
    setState(() {
      colorSelection = ColorSelection.values[value];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorSelection.color,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorSelection.color,
        brightness: Brightness.dark,
      ),
      themeMode: themeMode,
      home: home.MyHomePage(changeTheme: changeThemeMode),
    );
  }
}

