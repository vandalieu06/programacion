import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.taskName,
    required this.taskStatus,
    required this.onChanged,
    required this.deleteContext,
  });

  final String taskName;
  final bool taskStatus;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteContext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteContext, 
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(4.0),
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
            ),
          ]
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskStatus, 
                onChanged: onChanged,
                checkColor: Colors.black,
                activeColor: Colors.white,
                side: BorderSide(color: Colors.white, width: 2.0),
              ),
              Text(
                taskName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    decoration: taskStatus ? TextDecoration.lineThrough : TextDecoration.none,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
