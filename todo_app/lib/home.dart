import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/components/dialog_box.dart';
import 'package:todo_app/components/theme_button.dart';
import 'package:todo_app/components/todo_tile.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/todo_db/database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.changeTheme});

  final Function(bool useLightMode) changeTheme;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final _myBox = Hive.box('myBox');
  database db = database();

  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      db.updateData();
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () {
            Navigator.of(context).pop();
            _controller.clear();
          },
        );
      },
    );
  }

  void saveNewTask() {
    setState(() {
      //taskList.add([_controller.text, false]);
      db.toDoList.add([_controller.text, false]);
      db.updateData();
      Navigator.of(context).pop();
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      //taskList.removeAt(index);
      db.toDoList.removeAt(index);
      db.updateData();
    });
  }
  @override
  void initState(){
    if(_myBox.get('TODOLIST')== Null){
      db.createInitialData();
    }
    else{
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do App"),
        actions: [
          themeButton(changeTheme:widget.changeTheme )
        ],
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey(index),
            endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) => deleteTask(index),
                    icon: Icons.delete,
                    backgroundColor: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ],
            ),
            child: (
                TodoTile(
                  taskName: db.toDoList[index][0],
                  taskComplete: db.toDoList[index][1],
                  onChanged: (value) => checkBoxChange(value, index),
                )
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
        shape: CircleBorder(eccentricity: 1),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}