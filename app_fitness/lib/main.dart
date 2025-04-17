import 'package:flutter/material.dart';
import 'calculadora_imc.dart';
import 'nosotros.dart';
import 'my_home_screen.dart';
void main() {
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness 2025',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}