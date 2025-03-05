import 'package:flutter/material.dart';

enum ColorSelection{
  deepPurple("Deep Purple", Colors.deepPurple),
  purple("Purple", Colors.purple),
  indigo("Indigo", Colors.indigo),
  blue("Blue", Colors.blue),
  cyan("Cyan", Colors.cyan),
  teal("Teal", Colors.teal),
  green("Green", Colors.green),
  yellow("Yellow", Colors.yellow),
  pink("Pink", Colors.pink)
  ;
  final String nombre;
  final Color color;
  const ColorSelection(this.nombre, this.color);
}