import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      theme: ThemeData.dark(),
    ),
  );
}

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade100,
    primary: Colors.cyan.shade800,
    secondary: Colors.grey.shade100,
    inversePrimary: Colors.cyan.shade200,
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade300,
    primary: Colors.cyan.shade700,
    secondary: Colors.grey.shade300,
    inversePrimary: Colors.cyan.shade700,
  ),
);

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _AppState();
}

class _AppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[700],
        foregroundColor: Colors.white,
        title: Text(
          "Forever Library",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          spacing: 12,
          children: [
            Image.network(
              "https://static.vecteezy.com/system/resources/previews/021/493/641/non_2x/school-library-or-store-with-books-and-people-free-vector.jpg",
            ),
            Text("Home page"),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Image.network(
            "https://png.pngtree.com/png-clipart/20240721/original/pngtree-library-books-and-cute-kids-png-image_15604266.png",
            height: 170,
          ),
          DrawerHeader(
            child: Padding(
              padding: EdgeInsets.only(top: 2, bottom: 2, left: 2, right: 4),
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
              ),
            ),
          ),
          DrawerHeader(
            child: Padding(
              padding: EdgeInsets.only(top: 2, bottom: 2, left: 4, right: 4),
              child: ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("Profile"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forever Library",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          spacing: 12,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  "https://thumbs.dreamstime.com/b/cartoon-girl-reading-book-fairy-tales-magical-atmosphere-young-girl-engrossed-storybook-seated-amidst-lush-317262679.jpg",
                ),
              ),
            ),
            Center(
              child: Text(
                "Baran Bahar",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
