import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: const Text("Your Profile", style: TextStyle(fontSize: 22)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.brightness_medium),
            ),
          ],
        ),
        body: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0AnHRKiQfNyGpUfpWlHlpcSPVnrcOS9QQ3b2ptJRx0Q&s=10",
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.gray700,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Inputs
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Name", style: TextStyle(fontSize: 12)),
                  TextField(
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      hintText: "Alex",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                ],
              ),
            ),
            // Last Name
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Last Name", style: TextStyle(fontSize: 12)),
                  TextField(
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      hintText: "Keen",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                ],
              ),
            ),
            // Email
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Email", style: TextStyle(fontSize: 12)),
                  TextField(
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      hintText: "user@example.com",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
