import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

final player = AudioPlayer();
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue, // Define un color principal
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("7")
            ],
          ),
        ),
      ),
    );
  }
}
Expanded buildButton(String numberList) {
  return Expanded(
    child: TextButton(
      onPressed: () async{
        // Acción al presionar el botón
        try {
          print("note$numberList.wav");
          await player.play(AssetSource("note$numberList.wav"));
        } on Exception catch (e) {
          print('error: $e');
        }
      },
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.red),
      ),
      child: Text(
        'Click Me',
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}