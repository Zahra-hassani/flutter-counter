import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState ()=> _AppState();
}

class _AppState extends State<MyApp>{
  String name = "";
  
  Future<void> getName(){
    final sharedPreferences prefs = await sharedPreferences();
    
    await prefs.setString("userName","Ali");
    setState((){
      name = prefs.getString("userName");
    });
  }
  
  @override
  void initState(){
    getName();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       appBar: AppBar(
         title: Text("Shared preference"),
       ),
       body: Center(
         child: Text("My name is $name", style: TextStyle(fontSize: 20) )
       )
      )
    );
  }
}
