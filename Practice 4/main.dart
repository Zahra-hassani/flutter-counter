import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          leading: Icon(Icons.account_circle),
        ),
        body: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDg7XR2a3YUIDXiYX2NRG1ye5YLon7AecCRmOMD4tKniCLIB2mOpIqlSc&s=10",
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(height: 20),
              Center(child: Text("Welcome to my Profile!")),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    color: Colors.cyan.shade700,
                    height: 100,
                    width: 100,
                  ),
                  Expanded(
                    child: Container(height: 100, color: Colors.blue.shade800),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
