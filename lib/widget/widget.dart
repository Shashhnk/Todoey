import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/widget/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
        builder: (BuildContext context, taskData, Widget? child) {
      return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return TaskTile(
              Tasktitle: taskData.tasks[index].name,
              isCheck: taskData.tasks[index].isDone,
              checkBoxCallBack: (value) {
                taskData.updateTask(taskData.tasks[index]);
              },
              onLongPress: () {
                taskData.deleteTask(taskData.tasks[index]);
              },
            );
          },
          itemCount: taskData.taskCount);
    });
  }
}

class TaskTile extends StatelessWidget {
  final String Tasktitle;
  final bool isCheck;
  final Function(bool?) checkBoxCallBack;
  final Function() onLongPress;

  const TaskTile({
    super.key,
    required this.Tasktitle,
    required this.isCheck,
    required this.checkBoxCallBack,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        Tasktitle,
        style: TextStyle(
            decoration: isCheck ? TextDecoration.lineThrough : null,
            fontSize: 20),
      ),
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isCheck,
          onChanged: checkBoxCallBack),
    );
  }
}

class add_task extends StatelessWidget {
  TextEditingController acontroller = TextEditingController();
  add_task({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(
              20,
            ),
          ),
        ),
        child: Column(
          children: [
            const Text(
              'Add Task',
              style: TextStyle(
                fontSize: 20,
                color: Colors.lightBlueAccent,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            TextField(
              textAlign: TextAlign.center,
              controller: acontroller,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addtask(acontroller.text);
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Center(
                    child: Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
