import 'package:flutter/material.dart';
import 'package:task_schedular_flutter/widgets/completed_tasks_page.dart';
import 'package:task_schedular_flutter/widgets/new_task.dart';
import 'package:task_schedular_flutter/widgets/scheduled_tasks_page.dart';
import './models/tasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  bool mainDataFlag = true, fabVisibleFlag = true, clickFlag = true;

  final List<Tasks> _userTasks = [
        // Tasks(id: 'task1', title: 'Task1', description: 'check'),
        // Tasks(id: 'task1', title: 'Task1', description: 'check'),
        // Tasks(id: 'task1', title: 'Task1', description: 'check'),
        // Tasks(id: 'task1', title: 'Task1', description: 'check'),
        // Tasks(id: 'task1', title: 'Task1', description: 'check'),
        // Tasks(id: 'task1', title: 'Task1', description: 'check'),
        // Tasks(id: 'task1', title: 'Task1', description: 'check'),
        // Tasks(id: 'task1', title: 'Task1', description: 'check'),
        // Tasks(id: 'task1', title: 'Task1', description: 'check'),
        // Tasks(id: 'task1', title: 'Task1', description: 'check'),
        // Tasks(id: 'task1', title: 'Task1', description: 'check'),
        // Tasks(id: 'task1', title: 'Task1', description: 'check'),
        // Tasks(id: 'task1', title: 'Task1', description: 'check'),
      ],
      completedTasksList = [];

  void _addNewTask(String tsTitle, String tsDescription) {
    final newTs = Tasks(
      id: DateTime.now().toString(),
      title: tsTitle,
      description: tsDescription,
    );

    setState(() {
      _userTasks.add(newTs);
    });
  }

  void _startAddNewTask(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTask(_addNewTask),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final variableAppBar = AppBar(
      title: const Text('Task Scheduler'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.history),
        ),
      ],
    );

    return Scaffold(
      appBar: variableAppBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      variableAppBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          if (_userTasks.isNotEmpty) {
                            clickFlag = false;
                          }
                          mainDataFlag = true;
                          fabVisibleFlag = true;
                        });
                      },
                      splashColor: Colors.lightBlueAccent[100],
                      highlightColor: Colors.lightBlueAccent,
                      child: const Text(
                        'Scheduled',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    '|',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          fabVisibleFlag = false;
                          mainDataFlag = false;
                        });
                      },
                      splashColor: Colors.lightBlueAccent[100],
                      highlightColor: Colors.lightBlueAccent,
                      // color: Colors.blue,
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(60),
                      // ),
                      child: const Text(
                        'Completed',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      variableAppBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.9,
              child: mainDataFlag
                  ? ScheduledTasksPage(
                      _userTasks,
                      completedTasksList,
                      clickFlag,
                    )
                  : CompletedTasksPage(
                      _userTasks,
                      completedTasksList,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: fabVisibleFlag
          ? FloatingActionButton(
              onPressed: () => _startAddNewTask(context),
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
