import 'package:flutter/material.dart';
import 'package:coffee_card/home.dart';
//import 'package:coffee_card/widgets/sandbox.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, //Eliminar banner del debug mode
    home: Home(),
  ));
}


/* 
//PRIMERA CONFIG
void main() {
  runApp(MaterialApp(
    home: Center(
      child: Text("Hello world!", textAlign: TextAlign.left, textDirection: TextDirection.ltr,),
    ),
  ));
}

//SEGUNDA CONFIG
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      //width: 200.0,
      //height: 50.0,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.fromLTRB(30,10,0,10),
      //margin: EdgeInsets.only(left: 30.0, top: 5.0),
      child: Text(
        "Hello, nijas!",
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.0,
          fontWeight: FontWeight.w900,
          letterSpacing: 5,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

*/