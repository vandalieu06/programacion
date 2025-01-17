import 'package:flutter/material.dart';

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sandbox", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100.0,
            height: 120.0,
            color: Colors.amber,
            child: Text("Nota 1", textAlign: TextAlign.center),
          ),
          Container(
            width: 200.0,
            height: 140.0,
            color: Colors.purpleAccent,
            child: Text("Nota 2", textAlign: TextAlign.center),
          ),
          Container(
            width: 250,
            height: 160.0,
            color: Colors.pinkAccent,
            child: Text("Nota 3", textAlign: TextAlign.center),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class SandboxRow extends StatelessWidget {
  const SandboxRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            height: 120.0,
            color: Colors.amber,
            child: Text("Nota 1", textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
          ),
          Container(
            height: 160.0,
            color: Colors.purpleAccent,
            child: Text("Nota 2", textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
          ),
          Container(
            height: 200.0,
            color: Colors.pinkAccent,
            child: Text("Nota 3", textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
          ),
      ],
    );
  }
}