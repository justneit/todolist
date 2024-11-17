import 'package:flutter/material.dart';

class TodoView extends StatelessWidget {
    final String taskName;
    final bool taskDone;
    final Function(bool?)? onChanged;
    final VoidCallback onDelete;

  const TodoView({
    super.key, 
    required this.taskName, 
    required this.taskDone,
    required this.onChanged, 
    required this.onDelete
    });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.pink[200],
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Checkbox(value: taskDone, onChanged: onChanged, activeColor: Colors.black,),
            Text(
              taskName,
              style: TextStyle(
                decoration: taskDone ? TextDecoration.lineThrough : TextDecoration.none,
                fontWeight: FontWeight.bold
                ),
              ),
             const Spacer(),
           IconButton(onPressed: onDelete,
            icon: const Icon(Icons.delete),
                  ),

          ],
        ),  
      ),
    );
  }
}