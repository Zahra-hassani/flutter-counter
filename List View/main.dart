import 'package:flutter/material.dart';

void main() {
  runApp(Friends());
}

class Friends extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF294a80),
        textTheme: ThemeData.dark().textTheme.apply(
          bodyColor: Colors.blue[900],
          displayColor: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF294a80),
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Friend Requests"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: const <Widget>[
            ListTile(
              leading: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg",
                ),
              ),
              title: Text(
                "Sahar Karimi",
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
              subtitle: Text(
                "Hi, I use telegram",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://media.istockphoto.com/id/1796364817/photo/photo-portrait-of-pretty-young-girl-palms-hold-empty-space-compare-wear-trendy-brown-blouse.jpg?s=612x612&w=0&k=20&c=SUyVmAdpI6BQMVdOBYeSowQWMW1Da1wmmFaIqDgWPko=",
                ),
              ),
              title: Text(
                "Bahar Bakhter",
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
              subtitle: Text(
                "Hi, I use telegram",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://thumbs.dreamstime.com/b/cute-anime-boy-avatar-cartoon-young-man-smiling-illustration-vector-friendly-teenage-character-brown-wavy-hair-462379421.jpg",
                ),
              ),
              title: Text(
                "Ali Rahimi",
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
              subtitle: Text(
                "Hi, I use telegram",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://thumbs.dreamstime.com/b/d-icon-avatar-cute-smiling-woman-glasses-cartoon-hipster-character-people-close-up-portrait-isolated-transparent-png-349160284.jpg",
                ),
              ),
              title: Text(
                "Shahla Jamal",
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
              subtitle: Text(
                "Hi, I use telegram",
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
