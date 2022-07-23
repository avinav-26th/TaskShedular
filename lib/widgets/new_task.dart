import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  final Function addNewTs;
  const NewTask(this.addNewTs, {Key? key}) : super(key: key);

  @override
  NewTaskState createState() => NewTaskState();
}

class NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submitData() {
    if (_titleController.text.isEmpty || _descriptionController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text,
        enteredDescription = _descriptionController.text;

    widget.addNewTs(
      enteredTitle,
      enteredDescription,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: _titleController,
              autocorrect: true,
              onSubmitted: (_) => _submitData,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Description'),
              controller: _descriptionController,
              autocorrect: true,
              onSubmitted: (_) => _submitData,
            ),
            TextButton(
              onPressed: _submitData,
              child: const Text('Add Task'),
            )
          ],
        ),
      ),
    );
  }
}
