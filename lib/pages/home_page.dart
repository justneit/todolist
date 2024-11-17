import 'package:flutter/material.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _controller = TextEditingController();

  List toDoList = [
    ["Learn Flutter", false],
    ["Learn English", false],
    ["Do Exercise", false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: const Text("TO DO LIST", style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.pink[200],
        child: const Icon(Icons.add),
        ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder:(context, index) {
          return TodoView(taskName: toDoList[index][0], taskDone: toDoList[index][1], onChanged:(value) => checkBoxChange(value, index), onDelete: () => deleteTask(index) );
        },
        )
    );
  }

  void saveTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
    });
    _controller.clear();
    Navigator.of(context).pop();
  }

  deleteTask(index) {
      setState(() {
        toDoList.removeAt(index);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void checkBoxChange(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void createNewTask() {
      showDialog(context: context, builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveTask,
          );
      } 
    );
  }

}