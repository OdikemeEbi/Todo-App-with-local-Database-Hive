import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  Function(bool?)? onChange;
  Function(BuildContext)? deleteFunction;
  TodoTile(
      {super.key,
      required this.taskName,
      required this.isCompleted,
      required this.onChange,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0, left: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          // SlidableAction(
          //   onPressed: deleteFunction,
          //   icon: Icons.delete,
          //   backgroundColor: Colors.red.shade300,
          //   borderRadius: BorderRadius.circular(12),
          // )
          SlidableAction(
            onPressed: deleteFunction,
            //(context) {
            //   if (deleteFunction != null) {
            //     deleteFunction!(context);
            //   }
            // },
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              // CheckBox
              Checkbox(
                value: isCompleted,
                onChanged: onChange,
                activeColor: Colors.black,
              ),

              // Task name
              Text(
                taskName,
                style: TextStyle(
                    decoration: isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
