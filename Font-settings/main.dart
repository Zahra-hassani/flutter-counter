import 'package:flutter/material.dart';

void main() {
  /* code */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white 
          )
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Sanil",
            style: TextStyle(
              color: Colors.amber,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
        ),
        body: Column(
          children: [
            const Text(
              "Dubai",
              style: TextStyle(
                letterSpacing: 3,
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Dubai is one of the most popular cities in the world. This city is famous by its technology, visiting places and modern architectures.",
            ),
          ],
        ),
      ),
    );
  }
}
