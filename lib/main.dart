import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: CounterPage()));
}

class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => Counter();
}

class Counter extends State<CounterPage> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("My Counter"))),
        body: Center(child: Column(
            children: [
              Text("$counter"),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  child: Text("Increase")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      counter--;
                    });
                  },
                  child: Text("Decrease"))
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center),
    )
      );
  }
