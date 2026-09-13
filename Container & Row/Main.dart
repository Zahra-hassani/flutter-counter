import 'package:flutter/material.dart';

void main() {
  /* code */
  runApp(Profile());
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext ctx){
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink,
          foregroundColor: Colors.white 
        )
      ),
      home: Scaffold(
        appBar: AppBar(title:const Text("My Profile", style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 30,
          fontFamily: "cursive",
        ))),
        body: Column(
          children: [
            Container(
              height: 150,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.pink[500],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0,2)
                  )
                ]
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.person)
                  ),
                  Column(
                    children: [
                    const  Text("Sara Armani", style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      )),
                     const Text("Full Stack Web Developer", style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: Colors.white
                      ) )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center
                  )
                ],
              )
            )
          ] ,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        )
      )
    );
  }
}
