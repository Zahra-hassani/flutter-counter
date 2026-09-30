import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _DatePicker();
}

class _DatePicker extends State<MyApp> {
  DateTime selectedDate = DateTime.now();

  void _showDate() {
    showDatePicker(
      context: context,
      firstDate: DateTime(2012, 6),
      lastDate: DateTime(2056, 4),
      initialDate: selectedDate,
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedDate = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: Text(
            "Date Picker",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${selectedDate.year.toString()} - ${selectedDate.month.toString().padLeft(2, "0")} - ${selectedDate.day.toString().padLeft(2, "0")}",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            MaterialButton(
              color: Colors.deepPurple,
              onPressed: _showDate,
              child: Text(
                "Choose a Date",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
