import 'package:flutter/material.dart';

void main() {
  runApp(MyTask());
}

class MyTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange.shade800,
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Expanded",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.blue),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.red)),
                  Expanded(child: Container(color: Colors.yellow)),
                  Expanded(child: Container(color: Colors.purple)),
                ],
              ),
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
