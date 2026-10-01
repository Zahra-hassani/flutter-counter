import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  TimeOfDay selecetedTime = TimeOfDay(hour: 6, minute: 56);

  void _showTime() {
    showTimePicker(context: context, initialTime: selecetedTime).then((value) {
      if (value != null) {
        setState(() {
          selecetedTime = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[900],
        title: Center(
          child: Text(
            "Time Picker",
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${selecetedTime.format(context)}",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            MaterialButton(
              color: Colors.pink[800],
              onPressed: _showTime,
              child: Text(
                "Choose a Time",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
