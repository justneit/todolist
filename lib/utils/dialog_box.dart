import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
   const DialogBox({super.key, this.controller, required this.onSave});

  // ignore: prefer_typing_uninitialized_variables
  final controller;

  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.pink[200],
      content: Container(
        height: 120,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add your new task"
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                  MaterialButton(
                  onPressed: onSave,
                  color: Colors.pink[300],
                  child: const Text("Save"),
                  ),
                  const SizedBox(width: 10),
                  MaterialButton(
                  onPressed: Navigator.of(context).pop,
                  color: Colors.pink[300],
                  child: const Text("Cancel"),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}