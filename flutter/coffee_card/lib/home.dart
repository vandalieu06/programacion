import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Cofee Room",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 5, 
          ),
        ),
        backgroundColor: Colors.blueGrey[500],
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.brown[500],
            padding: EdgeInsets.all(20),
            child: Text(
              "First cofee...", 
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            color: Colors.brown[400],
            padding: EdgeInsets.all(20),
            child: Text(
              "Second cofee...",
              style: TextStyle(color: Colors.white),
            ),
           ),
        ],
      ),
    );
  }
}
