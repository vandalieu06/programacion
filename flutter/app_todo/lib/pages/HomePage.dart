import 'package:app_todo/utils/todoList.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List toDoList = [
    ['Learn Flutter', false],
    ['Drink Cofeee', false],
    ['Code With Freelance', true],
  ];

  void checkBoxChanged(int index){
    setState((){
      toDoList[index][1] = !toDoList[index][1]; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        title: Text(
          "Simple Todo",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, index) {
            return TodoList(
              taskName: toDoList[index][0],
              taskStatus: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(index),
            );
          }),
    );
  }
}