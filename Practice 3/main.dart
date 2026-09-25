import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My Flutter App')),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            color: Colors.purple,
            child: Text("Flutter Developer"),
          ),
        ),
      ),
    );
  }
}
