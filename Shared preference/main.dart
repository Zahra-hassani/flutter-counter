import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
home: HomePage(),
);
}
}

class HomePage extends StatefulWidget {
@override
State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
String name = "";

Future<void> fetchName() async {
final SharedPreferences prefs =
await SharedPreferences.getInstance();

await prefs.setString("userName", "Ali");

setState(() {
  name = prefs.getString("userName") ?? "";
});

}

@override
void initState() {
super.initState();
fetchName();
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
backgroundColor: Colors.purple,
foregroundColor: Colors.white,
title: Text("Shared Preference Practice"),
),
body: Padding(
padding: EdgeInsets.all(20),
child: Center(
child: Text(
"My name is $name",
style: TextStyle(fontSize: 20),
),
),
),
);
}
}
