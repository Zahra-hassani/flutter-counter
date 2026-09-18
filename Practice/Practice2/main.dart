import 'package:flutter/material.dart';

void main() {
  /* code */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Flutter App"),
          leading: Icon(Icons.menu),
        ),
        body: Column(
          children: [
            Text("Dashboard", style: TextStyle(fontSize: 24)),
            SizedBox(
              height: 110, // Increased height to prevent layout overflow
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors
                            .blue, // Correct property for background color
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors
                              .blue, // Correct property for background color
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
