import 'package:flutter/material.dart';

import 'moor_database.dart';

class NewTaskInput extends StatefulWidget {
  const NewTaskInput({
     Key? key,
  }) : super(key: key);

  @override
  _NewTaskInputState createState() => _NewTaskInputState();
}

class _NewTaskInputState extends State<NewTaskInput> {
  late DateTime newTaskDate;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _buildTextField(context),
        ],
      ),
    );
  }

  Expanded _buildTextField(BuildContext context) {
    return Expanded(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: 'Task Name'),
        onSubmitted: (inputName) {
          final task = TasksCompanion.insert(
            name: inputName,
          );
          AppDatabase().insertTask(task);
          resetValuesAfterSubmit();
        },
      ),
    );
  }

  void resetValuesAfterSubmit() {
    setState(() {
      controller.clear();
    });
  }
}
