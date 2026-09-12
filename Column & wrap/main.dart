import 'package:flutter/material.dart';

void main() {
  /* code */
  runApp(MaterialApp(home: MyApp()
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState()=> _MyState();
}

class _MyState extends State<MyApp>{
  @override
  Widget build(BuildContext ctx){
    return Scaffold(
      appBar: AppBar(title: Text("My App") ),
      body: Center(child: Column(
        children: [
          Text("Are you sure to start?"),
          Wrap(
            children: [
              Chip(label: Text("Yes", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
                backgroundColor: Colors.green[800]
              ),
              Chip(label: Text("No",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )
              ),
                backgroundColor: Colors.red[800]
              )
            ],
            spacing: 10
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start
      ))
    );
  }
}
