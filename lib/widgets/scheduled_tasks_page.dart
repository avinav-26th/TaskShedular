import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/tasks.dart';

class ScheduledTasksPage extends StatefulWidget {
  final List<Tasks> taskList, completedTasksList;
  final bool clickFlag;
  const ScheduledTasksPage(
      this.taskList, this.completedTasksList, this.clickFlag,
      {Key? key})
      : super(key: key);

  @override
  State<ScheduledTasksPage> createState() => _ScheduledTasksPageState();
}

class _ScheduledTasksPageState extends State<ScheduledTasksPage> {
  bool checkTaskListFlag = true;

  @override
  Widget build(BuildContext context) {
    if (widget.taskList.isEmpty) {
      if (checkTaskListFlag && widget.clickFlag) {
        return Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.1,
            ),
            const Text(
              'No task scheduled yet !',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.4,
                child: SvgPicture.asset(
                  'assets/no_data.svg',
                  semanticsLabel: 'No Data',
                ),
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top) *
                  0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'All tasks are completed ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  // height: 22,
                  // width: 22,
                  child: Image.asset(
                    'assets/completed_icon.png',
                    fit: BoxFit.cover,
                    height: 22,
                    width: 22,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.4,
                child: SvgPicture.asset(
                  'assets/completed.svg',
                  semanticsLabel: 'No Data',
                ),
              ),
            ),
          ],
        );
      }
    } else {
      checkTaskListFlag = false;
      return ListView.builder(
        itemCount: widget.taskList.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
            key: ValueKey(widget.taskList.elementAt(index)),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              setState(() {
                widget.completedTasksList.add(widget.taskList[index]);
                widget.taskList.removeAt(index);
              });
            },
            child: Card(
              color: Colors.lightBlueAccent,
              margin: const EdgeInsets.symmetric(
                vertical: 7,
                horizontal: 10,
              ),
              elevation: 6,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(
                    top: 13,
                    left: 10,
                    right: 10,
                    bottom: 6,
                  ),
                  child: Text(
                    widget.taskList[index].title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 13,
                  ),
                  child: Text(
                    widget.taskList[index].description,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
