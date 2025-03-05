import 'package:hive_flutter/hive_flutter.dart';

class database{
  final _myBox = Hive.box('myBox');
  List<List<dynamic>> toDoList = [];
  void loadData(){
    toDoList = List<List<dynamic>>.from(_myBox.get('TODOLIST', defaultValue: []));
  }
  void updateData(){
    _myBox.put('TODOLIST', toDoList);
  }
  void createInitialData() {
    toDoList = [
      ["Dar Clases", false],
      ["Comprar cena", false],
    ];
  }
}