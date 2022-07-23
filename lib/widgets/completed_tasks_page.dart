import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../models/tasks.dart';

class CompletedTasksPage extends StatefulWidget {
  final List<Tasks> taskList, completedTasksList;
  const CompletedTasksPage(this.taskList, this.completedTasksList, {Key? key})
      : super(key: key);

  @override
  State<CompletedTasksPage> createState() => _CompletedTasksPageState();
}

class _CompletedTasksPageState extends State<CompletedTasksPage> {

  @override
  Widget build(BuildContext context) {
    return widget.completedTasksList.isEmpty
        ? Column(
            children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) *
                    0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Complete tasks to see here',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top) *
                      0.4,
                  child: SvgPicture.asset(
                    'assets/add_notes.svg',
                    semanticsLabel: 'No Data',
                  ),
                ),
              ),
            ],
          )
        : ListView.builder(
            itemCount: widget.completedTasksList.length,
            itemBuilder: (ctx, index) {
              return Dismissible(
                key: ValueKey(widget.completedTasksList.elementAt(index)),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  setState(() {
                    widget.taskList.add(widget.completedTasksList[index]);
                    widget.completedTasksList.removeAt(index);
                  });
                },
                child: Card(
                  color: Colors.lightGreenAccent,
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
                        widget.completedTasksList[index].title,
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
                        widget.completedTasksList[index].description,
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
